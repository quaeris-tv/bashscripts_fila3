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

# Controllo se siamo in una repo Git
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "${RED}Errore: Questo script deve essere eseguito all'interno di una repository Git!${RESET}"
    exit 1
fi

echo "${YELLOW}==> Aggiornamento submodules...${RESET}"
git submodule update --progress --init --recursive --merge --rebase --remote
git submodule foreach "$SCRIPT_PATH" "$NEW_ORG" "$BRANCH"

echo "${YELLOW}==> Controllo configurazioni Git...${RESET}"

# Configurazioni Git per evitare problemi
log_info "Configurando Git..."
git config core.fileMode false
git config advice.skippedCherryPicks false
git config core.autocrlf input
git config core.ignorecase false
find . -type f -name "*:Zone.Identifier" -exec rm -f {} \;

# Assicuriamoci di essere sul branch corretto
log_info "Verifica del branch locale..."
git checkout "$BRANCH" -- || git checkout -b "$BRANCH"
log_info "Branch '$BRANCH' selezionato."

echo "${GREEN}✔ Branch attivo: $BRANCH${RESET}"



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

echo "${YELLOW}==> Push su remoto...${RESET}"
if ! git push origin HEAD:"$BRANCH" -u --progress 'origin'; then
    echo "${YELLOW}⚠ Tentativo di push alternativo...${RESET}"
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

sed -i -e 's/\r$//' "$SCRIPT_PATH"
echo "${GREEN}========= SYNC COMPLETATA CON SUCCESSO [$WHERE ($BRANCH)] =========${RESET}"
