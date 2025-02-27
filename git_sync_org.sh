#!/bin/bash
set -euo pipefail

# Funzione per la gestione dei colori
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Funzioni per i log
function log_info() {
    echo -e "${GREEN}[INFO] $1${NC}"
}

function log_warning() {
    echo -e "${YELLOW}[WARN] $1${NC}"
}

function log_error() {
    echo -e "${RED}[ERROR] $1${NC}"
}



# Funzione per sincronizzare un singolo repository
sync_repository() {
    local WHERE=$1
    local NEW_ORG=$2
    local BRANCH=$3
    
    cd "$WHERE" || return 1
    
    log_info "=== Sincronizzazione repository: $(basename "$WHERE") ==="
    
    # Gestione remote
    ORIGINAL_REMOTE=$(git config --get remote.origin.url)
    REPO_NAME=$(basename "$ORIGINAL_REMOTE" .git)
    NEW_REMOTE="git@github.com:$NEW_ORG/$REPO_NAME.git"
    
    log_info "Remote originale: $ORIGINAL_REMOTE"
    log_info "Nuovo remote: $NEW_REMOTE"
    
    # Verifica se il repository esiste nella nuova organizzazione
    if ! git ls-remote --exit-code "$NEW_REMOTE" >/dev/null 2>&1; then
        log_warning "Repository $REPO_NAME non trovato in $NEW_ORG, passo al successivo"
        return 0
    fi
    find . -type f -name "*:Zone.Identifier" -exec rm -f {} \;
    git add -A || echo '-48-'
    git commit -am . || echo '-49-'
    git pull "$NEW_REMOTE" || echo '-50-'
    git add -A  || echo '-51-'
    git commit -am . || echo '-52-'
    git push "$NEW_REMOTE" "$BRANCH" -u --progress 'origin' || git push --set-upstream origin "$BRANCH"  || echo '-53-'
    git checkout "$BRANCH" -- || echo '-55-'
    git rebase --continue || echo '-56-'
    return 0
}

# Controllo parametri
if [ -z "${1:-}" ] || [ -z "${2:-}" ]; then
    log_error "Specificare organizzazione e branch."
    echo "Uso: $0 <nuova-organizzazione> <branch>"
    exit 1
fi

NEW_ORG=$1
BRANCH=$2
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
me=$( readlink -f -- "$0";)
MAIN_REPO=$(pwd)

# Controllo se siamo in una repo Git
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    log_error "Questo script deve essere eseguito all'interno di una repository Git!"
    exit 1
fi

# Sincronizza il repository principale
git submodule foreach "$me" "$NEW_ORG" "$BRANCH"
sync_repository "$MAIN_REPO" "$NEW_ORG" "$BRANCH"


log_info "========= SINCRONIZZAZIONE COMPLETATA ==========="
