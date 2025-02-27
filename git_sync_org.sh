#!/bin/bash
set -euo pipefail

# Colori per UI/UX migliorata
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# Variabili globali
TOTAL_REPOS=0
SYNCED_REPOS=0
SKIPPED_REPOS=0
FAILED_REPOS=0
START_TIME=$(date +%s)

# Funzioni per i log migliorati
function log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

function log_warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

function log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

function log_success() {
    echo -e "${BOLD}${GREEN}[SUCCESS]${NC} $1"
}

function log_step() {
    echo -e "${BLUE}[STEP]${NC} $1"
}

# Mostra il banner
function show_banner() {
    clear
    echo -e "${BOLD}${CYAN}"
    echo "╔═══════════════════════════════════════════════════════╗"
    echo "║                 GIT SYNC ORGANIZATION                 ║"
    echo "╚═══════════════════════════════════════════════════════╝${NC}"
    echo
}

# Funzione per visualizzare la barra di progresso
function progress_bar() {
    local progress=$1
    local total=$2
    local size=40
    local completed=$((progress * size / total))
    local percent=$((progress * 100 / total))
    
    printf "${PURPLE}[${NC}"
    for ((i=0; i<size; i++)); do
        if [ $i -lt $completed ]; then
            printf "${GREEN}█${NC}"
        else
            printf "${YELLOW}░${NC}"
        fi
    done
    printf "${PURPLE}]${NC} ${BOLD}%d%%${NC} (%d/%d)\n" $percent $progress $total
}

# Funzione per chiedere conferma
function confirm_action() {
    local message=$1
    local default=${2:-"y"}
    
    local prompt
    if [ "$default" = "y" ]; then
        prompt="[Y/n]"
    else
        prompt="[y/N]"
    fi
    
    echo -e "${YELLOW}$message ${prompt}${NC}"
    read -r response
    response=${response:-$default}
    
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        return 0
    else
        return 1
    fi
}

# Funzione per sincronizzare un singolo repository
sync_repository() {
    local WHERE=$1
    local NEW_ORG=$2
    local BRANCH=$3
    local OPERATION_RESULT=0
    
    cd "$WHERE" || return 1
    
    REPO_NAME=$(basename "$WHERE")
    echo
    echo -e "${BOLD}${CYAN}═════════════════════════════════════════════════════════${NC}"
    log_info "Sincronizzazione repository: ${BOLD}$REPO_NAME${NC}"
    echo -e "${BOLD}${CYAN}═════════════════════════════════════════════════════════${NC}"
    
    # Gestione remote
    ORIGINAL_REMOTE=$(git config --get remote.origin.url)
    REPO_NAME=$(basename "$ORIGINAL_REMOTE" .git)
    NEW_REMOTE="git@github.com:$NEW_ORG/$REPO_NAME.git"
    
    log_info "Remote originale: ${CYAN}$ORIGINAL_REMOTE${NC}"
    log_info "Nuovo remote: ${CYAN}$NEW_REMOTE${NC}"
    
    # Verifica se il repository esiste nella nuova organizzazione
    echo -ne "${YELLOW}Verificando esistenza del repository remoto...${NC} "
    if ! git ls-remote --exit-code "$NEW_REMOTE" >/dev/null 2>&1; then
        echo -e "${RED}Non trovato!${NC}"
        log_warning "Repository $REPO_NAME non trovato in $NEW_ORG, passo al successivo"
        ((SKIPPED_REPOS++))
        return 0
    fi
    echo -e "${GREEN}Trovato!${NC}"
    
    # Aggiungi il nuovo remote temporaneo
    log_step "Aggiunta del remote temporaneo..."
    git remote remove new_org_remote 2>/dev/null || true
    if git remote add new_org_remote "$NEW_REMOTE"; then
        log_success "Remote temporaneo aggiunto con successo: ${CYAN}new_org_remote${NC}"
    else
        log_error "Impossibile aggiungere il remote temporaneo"
        ((FAILED_REPOS++))
        return 1
    fi
    
    # Rimozione dei file Zone.Identifier di Windows
    log_step "Pulizia file temporanei..."
    find . -type f -name "*:Zone.Identifier" -exec rm -f {} \; 2>/dev/null || true
    echo -e "${GREEN}Completato!${NC}"
    
    # Commit locale
    log_step "Commit delle modifiche locali..."
    if git add -A 2>/dev/null; then
        if ! git diff --quiet --cached; then
            # Ci sono modifiche da committare
            git commit -m "Sincronizzazione automatica $(date +"%Y-%m-%d %H:%M:%S")" || echo -e "${YELLOW}Nessun cambiamento da committare${NC}"
        else
            echo -e "${YELLOW}Nessun cambiamento da committare${NC}"
        fi
    else
        log_warning "Problemi nell'aggiungere file all'area di stage"
    fi
    
    # Pull dal repository remoto new_org
    log_step "Pull dal repository remoto nella nuova organizzazione..."
    if git pull new_org_remote "$BRANCH" || echo "${YELLOW}Pull non riuscito completamente${NC}"; then
        echo -e "${GREEN}Pull completato!${NC}"
    fi
    
    # Commit dopo il pull
    log_step "Commit dopo il pull..."
    git add -A 2>/dev/null || true
    if ! git diff --quiet --cached; then
        git commit -m "Merge dopo pull $(date +"%Y-%m-%d %H:%M:%S")" || echo -e "${YELLOW}Nessun cambiamento da committare${NC}"
    else
        echo -e "${YELLOW}Nessun cambiamento da committare${NC}"
    fi
    
    # Push al repository remoto nella nuova organizzazione
    log_step "Push al repository remoto nella nuova organizzazione..."
    echo -e "${YELLOW}Tentativo di push a ${BOLD}$NEW_REMOTE${NC}${YELLOW} sul branch ${BOLD}$BRANCH${NC}"
    
    if git push new_org_remote "$BRANCH" 2>/dev/null; then
        log_success "Push completato con successo alla nuova organizzazione!"
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
    
    # Rimozione del remote temporaneo
    log_step "Rimozione del remote temporaneo..."
    if git remote remove new_org_remote; then
        log_success "Remote temporaneo rimosso con successo"
    else
        log_warning "Impossibile rimuovere il remote temporaneo"
    fi
    
    # Aggiornamento del contatore totale
    ((TOTAL_REPOS++))
    
    return $OPERATION_RESULT
}

# Funzione per mostrare il riepilogo
function show_summary() {
    local end_time=$(date +%s)
    local duration=$((end_time - START_TIME))
    local minutes=$((duration / 60))
    local seconds=$((duration % 60))
    
    echo
    echo -e "${BOLD}${CYAN}═════════════════════════════════════════════════════════${NC}"
    echo -e "${BOLD}${CYAN}                      RIEPILOGO                          ${NC}"
    echo -e "${BOLD}${CYAN}═════════════════════════════════════════════════════════${NC}"
    echo -e "${BOLD}Repository totali:${NC}    $TOTAL_REPOS"
    echo -e "${BOLD}${GREEN}Sincronizzati:${NC}      $SYNCED_REPOS"
    echo -e "${BOLD}${YELLOW}Saltati:${NC}            $SKIPPED_REPOS"
    echo -e "${BOLD}${RED}Falliti:${NC}            $FAILED_REPOS"
    echo -e "${BOLD}Tempo di esecuzione:${NC} ${minutes}m ${seconds}s"
    echo -e "${BOLD}${CYAN}═════════════════════════════════════════════════════════${NC}"
    
    if [ $FAILED_REPOS -gt 0 ]; then
        echo -e "${YELLOW}Alcuni repository non sono stati sincronizzati correttamente."
        echo -e "Potrebbe essere necessario eseguire una sincronizzazione manuale.${NC}"
    fi
    
    if [ $SYNCED_REPOS -gt 0 ]; then
        echo -e "${GREEN}Sincronizzazione completata con successo per $SYNCED_REPOS repository!${NC}"
    fi
}

# Funzione di aiuto
function show_help() {
    echo -e "${BOLD}USO:${NC} $0 <nuova-organizzazione> <branch> [--help] [--no-confirm]"
    echo
    echo -e "${BOLD}PARAMETRI:${NC}"
    echo -e "  ${CYAN}<nuova-organizzazione>${NC}  Nome dell'organizzazione GitHub di destinazione"
    echo -e "  ${CYAN}<branch>${NC}               Branch da sincronizzare"
    echo
    echo -e "${BOLD}OPZIONI:${NC}"
    echo -e "  ${CYAN}--help${NC}                 Mostra questo messaggio di aiuto"
    echo -e "  ${CYAN}--no-confirm${NC}           Esegue senza richiedere conferma"
    echo
    echo -e "${BOLD}ESEMPIO:${NC}"
    echo -e "  $0 nuova-org master"
    echo -e "  $0 nuova-org develop --no-confirm"
    exit 0
}

# Elaborazione parametri
NO_CONFIRM=false
ARGS_TO_PASS=()

for arg in "$@"; do
    case $arg in
        --help)
            show_help
            ;;
        --no-confirm)
            NO_CONFIRM=true
            ARGS_TO_PASS+=("$arg")
            ;;
        *)
            ARGS_TO_PASS+=("$arg")
            ;;
    esac
done

# Controllo parametri
if [ -z "${ARGS_TO_PASS[0]:-}" ] || [ -z "${ARGS_TO_PASS[1]:-}" ]; then
    log_error "Parametri mancanti!"
    show_help
    exit 1
fi

NEW_ORG="${ARGS_TO_PASS[0]}"
BRANCH="${ARGS_TO_PASS[1]}"
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
me=$(readlink -f -- "$0")
MAIN_REPO=$(pwd)

# Mostra il banner
show_banner

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

# Richiedi conferma se non in modalità no-confirm
if [ "$NO_CONFIRM" = false ]; then
    if ! confirm_action "Vuoi procedere con la sincronizzazione?"; then
        log_info "Operazione annullata dall'utente."
        exit 0
    fi
fi

# Conta i submodule
SUBMODULE_COUNT=$(git submodule | wc -l)
if [ $SUBMODULE_COUNT -gt 0 ]; then
    log_info "Trovati ${BOLD}$SUBMODULE_COUNT${NC} submodule da sincronizzare."
    echo
    
    # Sincronizza i submodule - passando i parametri con ordine corretto
    # Usiamo set +e per evitare che uno script bloccato interrompa l'intero processo
    set +e
    git submodule foreach "$me" "$NEW_ORG" "$BRANCH" $([ "$NO_CONFIRM" = true ] && echo "--no-confirm") || true
    set -e
    log_warning "Completata sincronizzazione dei submodule, procedendo con il repository principale"
fi

# Sincronizza il repository principale
sync_repository "$MAIN_REPO" "$NEW_ORG" "$BRANCH"

# Mostra il riepilogo
show_summary

echo -e "${BOLD}${GREEN}Sincronizzazione completata!${NC}"
