#!/bin/bash
set -euo pipefail

# Verifica dipendenze necessarie
check_dependencies() {
    local missing_deps=0
    for cmd in curl jq ollama git sed tr; do
        if ! command -v "$cmd" >/dev/null 2>&1; then
            log_error "Comando richiesto non trovato: $cmd"
            missing_deps=1
        fi
    done
    if [ $missing_deps -eq 1 ]; then
        log_error "Installa le dipendenze mancanti e riprova"
        exit 1
    fi
}

# Verifica che Ollama sia in esecuzione
check_ollama() {
    if ! curl -s "http://localhost:11434/api/tags" >/dev/null 2>&1; then
        log_error "Ollama non è in esecuzione sulla porta 11434"
        exit 1
    fi
    
    # Verifica che il modello codellama:7b sia disponibile
    if ! curl -s "http://localhost:11434/api/tags" | jq -e '.models[] | select(.name=="codellama:7b")' >/dev/null 2>&1; then
        log_error "Modello codellama:7b non trovato. Esegui: ollama pull codellama:7b"
        exit 1
    fi
}

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

# Controllo parametri
if [ -z "$1" ] || [ -z "$2" ]; then
    log_error "Specificare organizzazione e branch."
    echo "Uso: $0 <nuova-organizzazione> <branch>"
    exit 1
fi

NEW_ORG=$1
BRANCH=$2
SCRIPT_PATH=$(readlink -f -- "$0")
WHERE=$(pwd)

# Controllo se siamo in una repo Git
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    log_error "Questo script deve essere eseguito all'interno di una repository Git!"
    exit 1
fi

log_info "Inizializzazione sincronizzazione in: $WHERE"
log_info "Organizzazione: $NEW_ORG, Branch: $BRANCH"

# Sincronizzazione submodules
log_info "Sincronizzazione submodules..."
git submodule foreach "bash $SCRIPT_PATH $NEW_ORG $BRANCH"

# Gestione remote
ORIGINAL_REMOTE=$(git config --get remote.origin.url)
REPO_NAME=$(basename "$ORIGINAL_REMOTE" .git)
NEW_REMOTE="git@github.com:$NEW_ORG/$REPO_NAME.git"

log_info "Remote originale: $ORIGINAL_REMOTE"
log_info "Nuovo remote: $NEW_REMOTE"

# Pulizia file di sistema
log_info "Rimozione file di sistema non necessari..."
find . -type f -name "*:Zone.Identifier" -exec rm -f {} \;

# Configurazioni Git
log_info "Configurazione Git..."
git config core.fileMode false
git config core.autocrlf input
git config core.ignorecase false

# Backup modifiche locali
log_info "Backup modifiche locali..."
git stash push -m "Backup pre-sync $(date '+%Y-%m-%d %H:%M:%S')"

# Pull dal nuovo remote
log_info "Pull dal nuovo remote..."
if ! git pull "$NEW_REMOTE" "$BRANCH" --allow-unrelated-histories; then
    log_warning "Pull fallito, continuo con la sincronizzazione..."
fi

# Normalizzazione e commit
log_info "Normalizzazione files..."
git add --renormalize -A

log_info "Commit modifiche..."
if git commit -am "Sync $(date '+%Y-%m-%d %H:%M:%S')"; then
    log_info "Modifiche committate con successo"
else
    log_warning "Nessuna modifica da committare"
fi

# Funzione per risolvere i conflitti usando Ollama
resolve_conflict() {
    local file=$1
    if [ ! -f "$file" ]; then
        log_error "File non trovato: $file"
        return 1
    fi
    
    local conflict_content
    conflict_content=$(cat "$file") || {
        log_error "Impossibile leggere il file: $file"
        return 1
    }
    
    # Verifica che il file contenga effettivamente dei conflitti
    if ! echo "$conflict_content" | grep -q '^<<<<<<< HEAD'; then
        log_error "Nessun conflitto trovato in: $file"
        return 1
    fi
    
    # Crea backup del file
    cp "$file" "${file}.backup" || {
        log_error "Impossibile creare backup di: $file"
        return 1
    }
    
    # Estrai le sezioni di conflitto con gestione errori
    local our_changes
    local their_changes
    our_changes=$(echo "$conflict_content" | sed -n '/^<<<<<<< HEAD/,/^=======/p' | sed '/^<<<<<<< HEAD/d;/^=======/d') || return 1
    their_changes=$(echo "$conflict_content" | sed -n '/^=======/,/^>>>>>>>/p' | sed '/^=======/d;/^>>>>>>>/d') || return 1
    
    if [ -z "$our_changes" ] || [ -z "$their_changes" ]; then
        log_error "Impossibile estrarre le sezioni di conflitto da: $file"
        return 1
    fi
    
    # Prepara il prompt per Ollama con contesto
    local file_ext=${file##*.}
    local prompt="Risolvi questo conflitto Git in un file ${file_ext}.

Contesto: Il file è ${file##*/}

Codice nostro (HEAD):
$our_changes

Codice loro:
$their_changes

Fornisci SOLO il codice risolto nel linguaggio ${file_ext}, senza commenti o spiegazioni."
    
    # Chiama Ollama con timeout e gestione errori
    local resolved_content
    resolved_content=$(timeout 30s curl -s -X POST http://localhost:11434/api/generate \
        -H "Content-Type: application/json" \
        -d "{\"model\":\"codellama:7b\",\"prompt\":\"$prompt\"}" | \
        jq -r '.response' | tr -d '\\n') || {
        log_error "Errore nella chiamata a Ollama per: $file"
        mv "${file}.backup" "$file"
        return 1
    }
    
    if [ -z "$resolved_content" ]; then
        log_error "Ollama ha restituito una risposta vuota per: $file"
        mv "${file}.backup" "$file"
        return 1
    fi
    
    # Verifica che la risoluzione non contenga ancora marcatori di conflitto
    if echo "$resolved_content" | grep -q '^<<<<<\|^>>>>>\|^====='; then
        log_error "La risoluzione contiene ancora marcatori di conflitto in: $file"
        mv "${file}.backup" "$file"
        return 1
    fi
    
    # Applica la risoluzione
    echo "$resolved_content" > "$file" || {
        log_error "Impossibile scrivere la risoluzione in: $file"
        mv "${file}.backup" "$file"
        return 1
    }
    
    # Verifica che il file non sia vuoto dopo la risoluzione
    if [ ! -s "$file" ]; then
        log_error "La risoluzione ha prodotto un file vuoto: $file"
        mv "${file}.backup" "$file"
        return 1
    fi
    
    git add "$file" || {
        log_error "Impossibile aggiungere il file risolto: $file"
        mv "${file}.backup" "$file"
        return 1
    }
    
    rm "${file}.backup"
    log_info "Conflitto risolto per $file usando Ollama"
    return 0
}

# Push al nuovo remote
log_info "Push al nuovo remote..."
if ! git push "$NEW_REMOTE" "$BRANCH" -u --progress; then
    log_warning "Push fallito, tentativo di risoluzione conflitti..."
    
    # Salva lo stato corrente
    current_commit=$(git rev-parse HEAD)
    
    # Prova a fare pull e gestisci i conflitti
    if ! git pull "$NEW_REMOTE" "$BRANCH" --no-rebase; then
        # Trova i file in conflitto
        conflict_files=$(git diff --name-only --diff-filter=U)
        
        if [ -n "$conflict_files" ]; then
            log_info "Trovati conflitti nei seguenti file:"
            echo "$conflict_files" | sed 's/^/- /'
            
            # Chiedi conferma prima di procedere con la risoluzione automatica
            read -p "Vuoi procedere con la risoluzione automatica? (s/n) " -n 1 -r
            echo
            if [[ ! $REPLY =~ ^[Ss]$ ]]; then
                log_info "Risoluzione automatica annullata"
                git merge --abort
                exit 1
            fi
            
            # Conta i file in conflitto
            conflict_count=$(echo "$conflict_files" | wc -l)
            current_file=0
            
            for file in $conflict_files; do
                ((current_file++))
                log_info "Risoluzione conflitto ($current_file/$conflict_count): $file"
                
                if resolve_conflict "$file"; then
                    log_info "✓ Conflitto risolto per $file"
                else
                    log_error "✗ Impossibile risolvere automaticamente il conflitto per $file"
                    log_info "Ripristino allo stato precedente..."
                    git merge --abort
                    git reset --hard "$current_commit"
                    log_warning "Per favore, risolvi manualmente il conflitto e riprova"
                    exit 1
                fi
            done
            
            # Verifica che tutti i conflitti siano stati risolti
            if git diff --check; then
                log_info "Tutti i conflitti sono stati risolti correttamente"
                
                # Commit delle risoluzioni
                if git commit -m "Risoluzione automatica conflitti usando Ollama $(date '+%Y-%m-%d %H:%M:%S')"; then
                    # Riprova il push
                    if git push "$NEW_REMOTE" "$BRANCH" -u --progress; then
                        log_info "Push completato con successo dopo la risoluzione dei conflitti"
                    else
                        log_error "Push fallito dopo la risoluzione dei conflitti"
                        git reset --hard "$current_commit"
                        exit 1
                    fi
                else
                    log_error "Impossibile committare le risoluzioni"
                    git reset --hard "$current_commit"
                    exit 1
                fi
            else
                log_error "Rimangono conflitti non risolti"
                git reset --hard "$current_commit"
                exit 1
            fi
        else
            log_error "Errore nel pull ma nessun conflitto trovato"
            exit 1
        fi
    fi
fi

# Recupero modifiche locali
log_info "Recupero modifiche locali..."
git stash pop

# Pulizia finale
log_info "Pulizia finale..."
sed -i 's/\r$//' "$SCRIPT_PATH"

log_info "========= SYNC COMPLETATA CON SUCCESSO [$WHERE ($BRANCH)] ========="
