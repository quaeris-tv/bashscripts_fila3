#!/bin/sh

# Controllo parametri
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Errore: specificare organizzazione e branch."
    echo "Uso: $0 <nuova-organizzazione> <branch>"
    exit 1
fi

NEW_ORG=$1
BRANCH=$2
SCRIPT_PATH=$(readlink -f -- "$0")
WHERE=$(pwd)

# Configurazioni Git per evitare problemi
git config core.fileMode false
git config advice.skippedCherryPicks false
git config core.autocrlf input

# Assicuriamoci di essere sul branch corretto
git checkout "$BRANCH" -- || git checkout -b "$BRANCH"

echo "--------- INIZIO SYNC [$WHERE ($BRANCH)] ----------"

# Aggiorna i submodules con forza per evitare disallineamenti
git submodule update --progress --init --recursive --force --merge --rebase --remote

# Sincronizza tutti i submodules ricorsivamente
git submodule foreach "$SCRIPT_PATH" "$NEW_ORG" "$BRANCH"

# Ottieni l'URL remoto attuale
ORIGINAL_REMOTE=$(git config --get remote.origin.url)
REPO_NAME=$(basename "$ORIGINAL_REMOTE" .git)

# Costruisce il nuovo URL remoto con l'organizzazione specificata
NEW_REMOTE="git@github.com:$NEW_ORG/$REPO_NAME.git"

echo "Nuovo remoto: $NEW_REMOTE"

# Modifica temporaneamente il remote
git remote set-url origin "$NEW_REMOTE"

# Aggiunge e normalizza tutti i file per evitare problemi di permessi e formattazione
git add --renormalize -A

# Commit automatico delle modifiche locali (se presenti)
git commit -am "Auto-sync" || echo "------------------- Nessuna modifica da committare -------------------"

# Push con fallback in caso di errore
if ! git push origin "$BRANCH" -u --progress 'origin'; then
    git push --set-upstream origin "$BRANCH"
fi

echo "--------- FINE PUSH [$WHERE ($BRANCH)] ----------"

# Imposta il tracking del branch remoto
git branch --set-upstream-to=origin/$BRANCH $BRANCH
git branch -u origin/$BRANCH

# Merge per garantire allineamento locale
git merge "$BRANCH"

echo "--------- FINE MERGE [$WHERE ($BRANCH)] ----------"

# Pull con autostash per evitare problemi con modifiche locali
git pull origin "$BRANCH" --autostash --recurse-submodules --allow-unrelated-histories --prune --progress -v --rebase

echo "--------- FINE PULL [$WHERE ($BRANCH)] ----------"

# Aggiorna nuovamente i submodules per garantire la sincronizzazione completa
git submodule update --progress --init --recursive --force --merge --rebase --remote

# Ultima verifica del checkout per sicurezza
git checkout "$BRANCH" --

# Ripristina il remote originale
git remote set-url origin "$ORIGINAL_REMOTE"
echo "Ripristinato remote originale: $ORIGINAL_REMOTE"
sed -i 's/\r$//' "$SCRIPT_PATH"
echo "========= SYNC COMPLETATA CON SUCCESSO [$WHERE ($BRANCH)] ========="
