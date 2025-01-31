#!/bin/bash

# Funzione per aggiornare un submodule
update_submodule() {
    local submodule_path="$1"
    
    # Vai nella cartella del submodule
    cd "$submodule_path" || exit

    # Verifica se ci sono modifiche locali
    if [[ $(git status --porcelain) ]]; then
        echo "Il submodule $submodule_path ha modifiche locali. Eseguo push e pull..."

        # Push delle modifiche locali
        git add .
        git commit -m "Committing local changes in $submodule_path"
        git push

        # Pull dell'ultimo cambiamento dal repository remoto
        git pull origin $(git rev-parse --abbrev-ref HEAD)
    else
        echo "Il submodule $submodule_path non ha modifiche locali. Nessuna azione necessaria."
    fi

    # Torna alla directory principale
    cd - || exit
}

# Verifica lo stato dei submodules
echo "Verifica stato dei submodules..."
git submodule status | while read -r line; do
    # Estrai il percorso del submodule (dalla riga di output di git submodule status)
    submodule_path=$(echo "$line" | awk '{ print $2 }')

    # Aggiorna il submodule solo se ha modifiche
    update_submodule "$submodule_path"
done

# Dopo aver aggiornato tutti i submodules, ritorna alla directory principale
echo "Aggiornamento submodules completato."
