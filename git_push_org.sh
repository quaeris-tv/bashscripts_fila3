#!/bin/bash

# Configurazioni
TARGET_BRANCH="dev"  # Branch di destinazione per il push
REMOTE_TYPE="ssh"    # Può essere "ssh" o "https"

# Funzione per mostrare l'uso corretto
usage() {
    echo "Usage: $0 <new-organization-name>"
    exit 1
}

# Controlla se è fornito il nome dell'organizzazione
if [ $# -ne 1 ]; then
    usage
fi

NEW_ORG="$1"

# Controlla se esiste il file .gitmodules
if [ ! -f .gitmodules ]; then
    echo "Errore: file .gitmodules non trovato!"
    exit 1
fi

# Funzione per elaborare un submodule
process_submodule() {
    local SUBMODULE_PATH=$1

    echo "Elaborazione submodule: $SUBMODULE_PATH"

    # Controlla se la directory esiste
    if [ ! -d "$SUBMODULE_PATH" ]; then
        echo "Avviso: Directory $SUBMODULE_PATH non esiste, saltando..."
        return
    fi

    # Entra nella directory del submodule
    (
        cd "$SUBMODULE_PATH" || {
            echo "Errore: impossibile accedere alla directory $SUBMODULE_PATH"
            return
        }

        # Ottieni il nome del repository dall'URL remoto corrente
        REPO_NAME=$(basename "$(git config --get remote.origin.url)" .git)

        # Crea il nuovo URL remoto
        if [ "$REMOTE_TYPE" == "https" ]; then
            NEW_REMOTE="https://github.com/$NEW_ORG/$REPO_NAME.git"
        else
            NEW_REMOTE="git@github.com:$NEW_ORG/$REPO_NAME.git"
        fi

        echo "Nuovo remoto: $NEW_REMOTE"

        # Aggiorna il remoto (se necessario)
        git remote set-url origin "$NEW_REMOTE"

        # Prova a fare push
        if ! git push origin HEAD:"$TARGET_BRANCH"; then
            echo "Push fallito. Tentativo di sincronizzazione con il remoto..."

            # Tenta di fare pull e sincronizzare
            git fetch origin
            if git merge origin/"$TARGET_BRANCH"; then
                echo "Merge riuscito. Riprovando il push..."
                git push origin HEAD:"$TARGET_BRANCH"
            elif git rebase origin/"$TARGET_BRANCH"; then
                echo "Rebase riuscito. Riprovando il push..."
                git push origin HEAD:"$TARGET_BRANCH"
            else
                echo "Errore durante il merge o il rebase. Controllare manualmente il submodule $SUBMODULE_PATH."
            fi
        else
            echo "Push completato con successo per $SUBMODULE_PATH"
        fi

        echo "----------------------------------------"
    )
}

# Leggi il file .gitmodules e processa ogni submodule
while IFS= read -r line; do
    # Estrai il percorso del submodule
    if [[ $line =~ path\ =\ (.+)$ ]]; then
        SUBMODULE_PATH=$(echo "${BASH_REMATCH[1]}" | xargs)
        process_submodule "$SUBMODULE_PATH"
    fi
done < .gitmodules

echo "Tutti i submodules sono stati elaborati con successo!"
