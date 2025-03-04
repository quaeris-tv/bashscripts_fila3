#!/bin/bash
# Script per sincronizzare repository Git tra organizzazioni
# Uso: ./git_sync_org.sh <org> <branch> [--no-confirm]
set -euo pipefail

# Colori e contatori
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'
TOTAL=0
SYNCED=0
SKIPPED=0
FAILED=0

# Log
log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Sincronizza repository
sync_repo() {
    cd "$1" || return 1
    REPO_NAME=$(basename "$1")
    log_info "Sync: $REPO_NAME"
    
    # URL remotes
    ORIG_REMOTE=$(git config --get remote.origin.url)
    REPO_NAME=$(basename "$ORIG_REMOTE" .git)
    NEW_REMOTE="git@github.com:$2/$REPO_NAME.git"
    
    # Verifica esistenza repository
    if ! git ls-remote --exit-code "$NEW_REMOTE" &>/dev/null; then
        log_warn "Repository non trovato in $2"
        ((SKIPPED++))
        ((TOTAL++))
        return 0
    fi
    
<<<<<<< HEAD
    # Salva il remote URL originale
    ORIGINAL_URL=$(git config --get remote.origin.url)
    
    # Aggiorna temporaneamente l'URL del remote origin
    log_step "Aggiornamento temporaneo dell'URL del remote origin..."
    if git remote set-url origin "$NEW_REMOTE"; then
        log_success "Remote URL aggiornato temporaneamente a: ${CYAN}$NEW_REMOTE${NC}"
    else
        log_error "Impossibile aggiornare il remote URL"
        ((FAILED_REPOS++))
        return 1
=======
    # Pulizia e commit
    find . -type f -name "*:Zone.Identifier" -exec rm -f {} \; &>/dev/null || true
    git add -A &>/dev/null || true
    git diff --quiet --cached &>/dev/null || git commit -m "Sync $(date +"%Y-%m-%d %H:%M:%S")" || true
    
    # Cambia remote, pull/push e ripristina
    git remote set-url origin "$NEW_REMOTE"
    git pull origin "$3" || true
    
    if git push -u origin HEAD:"$3"; then
        log_info "Push completato!"
        ((SYNCED++))
    else
        log_warn "Push fallito"
        ((FAILED++))
>>>>>>> cc0734de (.)
    fi
    
    git checkout "$3" &>/dev/null || true
    git remote set-url origin "$ORIG_REMOTE"
    
<<<<<<< HEAD
    # Commit locale
    log_step "Commit delle modifiche locali..."
    if git add -A 2>/dev/null; then
        if ! git diff --quiet --cached; then
            # Ci sono modifiche da committare
            #git commit -m "Sincronizzazione automatica $(date +"%Y-%m-%d %H:%M:%S")" || echo -e "${YELLOW}Nessun cambiamento da committare${NC}"
            oco --yes
        else
            echo -e "${YELLOW}Nessun cambiamento da committare${NC}"
        fi
    else
        log_warning "Problemi nell'aggiungere file all'area di stage"
    fi
    
    # Pull dal repository remoto
    log_step "Pull dal repository remoto..."
    if git pull origin "$BRANCH" || echo "${YELLOW}Pull non riuscito completamente${NC}"; then
        echo -e "${GREEN}Pull completato!${NC}"
    fi
    
    # Commit dopo il pull
    log_step "Commit dopo il pull..."
    git add -A 2>/dev/null || true
    if ! git diff --quiet --cached; then
        #git commit -m "Merge dopo pull $(date +"%Y-%m-%d %H:%M:%S")" || echo -e "${YELLOW}Nessun cambiamento da committare${NC}"
        oco --yes
    else
        echo -e "${YELLOW}Nessun cambiamento da committare${NC}"
    fi
    
    # Push al repository remoto
    log_step "Push al repository remoto..."
    echo -e "${YELLOW}Tentativo di push a ${BOLD}$NEW_REMOTE${NC}${YELLOW} sul branch ${BOLD}$BRANCH${NC}"
    
    if git push -u origin "$BRANCH" 2>/dev/null || git push 2>/dev/null; then
        log_success "Push completato con successo!"
        ((SYNCED_REPOS++))
    else
        log_warning "Push non riuscito, potrebbe richiedere attenzione manuale"
        ((FAILED_REPOS++))
        OPERATION_RESULT=1
    fi
    
    # Checkout del branch richiesto
    log_step "Checkout del branch $BRANCH..."
    if git checkout "$BRANCH" -- 2>/dev/null || echo "${YELLOW}Checkout non riuscito${NC}"; then
        echo -e "${GREEN}Checkout completato!${NC}"
    fi
    
    # Gestione rebase
    if git rebase --continue 2>/dev/null || echo "${YELLOW}Nessun rebase in corso${NC}"; then
        echo -e "${GREEN}Rebase completato!${NC}"
    fi
    
    # Ripristina il remote URL originale
    log_step "Ripristino dell'URL del remote originale..."
    if git remote set-url origin "$ORIGINAL_URL"; then
        log_success "Remote URL ripristinato a: ${CYAN}$ORIGINAL_URL${NC}"
    else
        log_warning "Impossibile ripristinare il remote URL originale"
    fi
    
    # Aggiornamento del contatore totale
    ((TOTAL_REPOS++))
    
    return $OPERATION_RESULT
=======
    ((TOTAL++))
    return 0
>>>>>>> cc0734de (.)
}

# Elabora parametri
if [ "$#" -lt 2 ] || [ "$1" = "--help" ]; then
    echo "Uso: $0 <org> <branch> [--no-confirm]"
    echo "Esempio: $0 nuova-org main"
    exit 0
fi

NEW_ORG="$1"
BRANCH="$2"
NO_CONFIRM=false
[ "$#" -gt 2 ] && [ "$3" = "--no-confirm" ] && NO_CONFIRM=true
SCRIPT_PATH=$(readlink -f "$0")
MAIN_REPO=$(pwd)

# Verifica Git
git rev-parse --is-inside-work-tree &>/dev/null || { log_error "Devi essere in un repository Git!"; exit 1; }

<<<<<<< HEAD
# Controllo se siamo in una repo Git
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    log_error "Questo script deve essere eseguito all'interno di una repository Git!"
    exit 1
fi

# Informazioni iniziali
echo -e "${BOLD}Dettagli operazione:${NC}"
echo -e "${BOLD}Organizzazione:${NC} ${CYAN}$NEW_ORG${NC}"
echo -e "${BOLD}Branch:${NC} ${CYAN}$BRANCH${NC}"
echo -e "${BOLD}Repository principale:${NC} ${CYAN}$(basename "$MAIN_REPO")${NC}"
echo

# Richiedi conferma solo una volta all'inizio
=======
# Conferma
echo "Operazione: sync con $NEW_ORG su branch $BRANCH"
>>>>>>> cc0734de (.)
if [ "$NO_CONFIRM" = false ]; then
    echo -e "${YELLOW}Procedere? [Y/n]${NC}"
    read -r response
    [[ ! "${response:-y}" =~ ^[Yy] ]] && { log_info "Annullato."; exit 0; }
fi

# Submoduli
SUBMODULE_COUNT=$(git submodule | wc -l)
<<<<<<< HEAD
if [ $SUBMODULE_COUNT -gt 0 ]; then
    log_info "Trovati ${BOLD}$SUBMODULE_COUNT${NC} submodule da sincronizzare."
    echo
    
    # Sincronizza i submodule - passando i parametri con ordine corretto e la flag no-confirm
    # in modo che non chieda ulteriori conferme
    set +e
    git submodule foreach "$me" "$NEW_ORG" "$BRANCH" --no-confirm || true
=======
if [ "$SUBMODULE_COUNT" -gt 0 ]; then
    log_info "Trovati $SUBMODULE_COUNT submodule"
    set +e
    git submodule foreach "$SCRIPT_PATH" "$NEW_ORG" "$BRANCH" $([ "$NO_CONFIRM" = true ] && echo "--no-confirm") || true
>>>>>>> cc0734de (.)
    set -e
fi

# Sincronizza repo principale
set +e
sync_repo "$MAIN_REPO" "$NEW_ORG" "$BRANCH"
set -e

# Riepilogo
echo -e "\nRiepilogo: $TOTAL totali, $SYNCED sync, $SKIPPED saltati, $FAILED falliti"
[ "$FAILED" -gt 0 ] && log_warn "Alcuni repository richiedono attenzione manuale"
echo "Completato!"
