#!/bin/bash

# Funzione per la gestione dei colori e migliorare l'esperienza utente
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # Nessun colore

# Funzione per mostrare messaggi di log colorati
function log_info() {
    echo -e "${GREEN}$1${NC}"
}

function log_warning() {
    echo -e "${YELLOW}$1${NC}"
}

function log_error() {
    echo -e "${RED}$1${NC}"
}

# Controllo dei parametri
if [ -z "$1" ] || [ -z "$2" ]; then
    log_error "Errore: specificare organizzazione e branch."
    echo "Uso: $0 <nuova-organizzazione> <branch>"
    exit 1
fi

NEW_ORG=$1
BRANCH=$2
SCRIPT_PATH=$(readlink -f -- "$0")
WHERE=$(pwd)

log_info "Inizializzazione... ($WHERE)"
log_info "Organizzazione: $NEW_ORG, Branch: $BRANCH"

# Configurazioni Git per evitare problemi
log_info "Configurando Git..."
git config core.fileMode false
git config advice.skippedCherryPicks false
git config core.autocrlf input

# Aggiornamento del repository
log_info "Recupero degli aggiornamenti dal repository remoto..."
git fetch origin

# Assicuriamoci di essere sul branch corretto
log_info "Verifica del branch locale..."
git checkout "$BRANCH" -- || git checkout -b "$BRANCH"
log_info "Branch '$BRANCH' selezionato."

# Aggiorna i submodules con forza per evitare disallineamenti
log_info "Aggiornamento submodules..."
git submodule update --progress --init --recursive --force --merge --rebase --remote

# Sincronizza i submodules ricorsivamente
log_info "Sincronizzazione dei submodules..."
git submodule foreach "bash $SCRIPT_PATH $NEW_ORG $BRANCH"

# Ottieni l'URL remoto attuale
ORIGINAL_REMOTE=$(git config --get remote.origin.url)
REPO_NAME=$(basename "$ORIGINAL_REMOTE" .git)

# Costruisce il nuovo URL remoto con l'organizzazione specificata
NEW_REMOTE="git@github.com:$NEW_ORG/$REPO_NAME.git"
log_info "Nuovo remoto: $NEW_REMOTE"

# Modifica temporaneamente il remote
log_info "Impostando il nuovo URL del remote..."
git remote set-url origin "$NEW_REMOTE"

# Aggiunge e normalizza tutti i file per evitare problemi di permessi e formattazione
log_info "Normalizzazione dei file..."
git add --renormalize -A

# Salvataggio delle modifiche locali non ancora committate
log_info "Salvando modifiche locali..."
git stash push -m "Backup modifiche locali prima della sincronizzazione"

# Commit automatico delle modifiche locali (se presenti)
log_info "Verifica delle modifiche locali..."
if git commit -am "Auto-sync"; then
    log_info "Modifiche committate."
else
    log_warning "Nessuna modifica da committare."
fi

# Push con fallback in caso di errore
log_info "Eseguendo push..."
if ! git push origin "$BRANCH" -u --progress; then
    log_warning "Errore nel push. Riprovando con --set-upstream."
    git push --set-upstream origin "$BRANCH"
fi

# Imposta il tracking del branch remoto
log_info "Impostando il tracking del branch remoto..."
git branch --set-upstream-to=origin/$BRANCH $BRANCH
git branch -u origin/$BRANCH

# Sincronizzazione completa con rebase (senza rischio di perdere cambiamenti)
log_info "Sincronizzazione con rebase per allineamento..."
git fetch origin
git rebase origin/$BRANCH

# Gestione dei conflitti: in caso di conflitto, ci fermiamo per permettere la risoluzione manuale
if [ $? -ne 0 ]; then
    log_error "Ci sono conflitti durante il rebase. Risolvili e poi esegui 'git rebase --continue'."
    exit 1
fi

# Merge per garantire allineamento locale
log_info "Verifica dell'allineamento locale..."
git merge "$BRANCH"

# Pull con autostash per evitare conflitti con modifiche locali
log_info "Pull dei cambiamenti con autostash..."
git pull origin "$BRANCH" --autostash --recurse-submodules --allow-unrelated-histories --prune --progress -v --rebase

# Aggiorna nuovamente i submodules per garantire la sincronizzazione completa
log_info "Aggiornamento finale dei submodules..."
git submodule update --progress --init --recursive --force --merge --rebase --remote

# Ultima verifica del checkout per sicurezza
log_info "Verifica finale del checkout del branch..."
git checkout "$BRANCH" --

# Ripristina il remote originale
log_info "Ripristinando il remote originale..."
git remote set-url origin "$ORIGINAL_REMOTE"
echo "Ripristinato remote originale: $ORIGINAL_REMOTE"

# Rimuove i ritorni a capo in eccesso (per evitare problemi su Windows)
log_info "Pulizia dei ritorni a capo..."
sed -i 's/\r$//' "$SCRIPT_PATH"

# Recupero delle modifiche locali salvate
log_info "Recupero modifiche locali..."
git stash pop

log_info "========= SYNC COMPLETATA CON SUCCESSO [$WHERE ($BRANCH)] ========="
