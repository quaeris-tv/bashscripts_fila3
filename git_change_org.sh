#!/bin/bash

# Verifica se il nome della nuova organizzazione è stato fornito
if [ $# -ne 1 ]; then
    echo "Usage: $0 <new-organization-name>"
    exit 1
fi

NEW_ORG="$1"

# Verifica se il file .gitmodules esiste
if [ ! -f .gitmodules ]; then
    echo "Error: .gitmodules file not found!"
    exit 1
fi

# Funzione per aggiornare il remote del repository principale
update_main_repo_remote() {
    # Ottieni il nome del repository principale (senza l'estensione .git)
    REPO_NAME=$(basename "$(git config --get remote.origin.url)" .git)
    
    # Crea il nuovo URL del remote per il repository principale
    NEW_REMOTE="git@github.com:$NEW_ORG/$REPO_NAME.git"
    
    # Aggiorna il remote principale (origin) con il nuovo URL
    echo "Updating main repository remote to: $NEW_REMOTE"
    git remote set-url origin "$NEW_REMOTE" || {
        echo "Error: Failed to set new remote URL for the main repository"
        exit 1
    }
}

# Aggiorna il remote per il repository principale
update_main_repo_remote

# Loop attraverso ogni sottogruppo nel file .gitmodules e aggiorna il remote
while IFS= read -r line; do
    # Pulisci la linea (rimuovi ritorni a capo e spaziatura)
    line=$(echo "$line" | tr -d '\r' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
    
    # Cerca il path del sottogruppo
    if [[ $line =~ path\ =\ (.+)$ ]]; then
        SUBMODULE_PATH="${BASH_REMATCH[1]}"
        # Pulisci il path del sottogruppo
        SUBMODULE_PATH=$(echo "$SUBMODULE_PATH" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

        echo "Processing submodule: $SUBMODULE_PATH"
        
        # Verifica se la directory del sottogruppo esiste
        if [ ! -d "$SUBMODULE_PATH" ]; then
            echo "Warning: Directory $SUBMODULE_PATH does not exist, skipping..."
            continue
        fi
        
        # Entra nella directory del sottogruppo
        (
            cd "$SUBMODULE_PATH" || { echo "Error: Could not enter directory $SUBMODULE_PATH"; exit 1; }
            
            # Ottieni il nome del repository dal remote URL del sottogruppo
            REPO_NAME=$(basename "$(git config --get remote.origin.url)" .git)
            
            # Crea il nuovo URL del remote per il sottogruppo
            NEW_REMOTE="git@github.com:$NEW_ORG/$REPO_NAME.git"
            
            # Imposta il nuovo URL del remote per il sottogruppo
            git remote set-url origin "$NEW_REMOTE" || {
                echo "Error: Failed to set new remote URL for $SUBMODULE_PATH"
                return 1
            }
            
            # Opzionale: fetch e pull dal nuovo remote (se necessario, decommenta)
            # git fetch "$NEW_REMOTE" || { echo "Error: Failed to fetch from $NEW_REMOTE"; return 1; }
            # git pull "$NEW_REMOTE" || { echo "Error: Failed to pull from $NEW_REMOTE"; return 1; }
            
            echo "----------------------------------------"
        )
    fi
done < .gitmodules

echo "All submodules and main repository have been updated!"
