#!/bin/bash

# Funzione per aggiornare un submodule
update_submodule() {
    local submodule_path="$1"
    
    # Vai nella cartella del submodule
    cd "$submodule_path" || exit

    # Verifica se ci sono modifiche locali nel submodule
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

# Funzione per aggiornare la root del repository
update_root() {
    echo "Controllando modifiche nella root del repository..."

    # Verifica se ci sono modifiche locali nella root
    if [[ $(git status --porcelain) ]]; then
        echo "Ci sono modifiche locali nella root. Eseguo push e pull..."

        # Push delle modifiche locali nella root
        git add .
        git commit -m "Committing local changes in the root repository"
        git push

        # Esegui il pull nella root, scegliendo il metodo migliore per evitare conflitti
        # Controlla se ci sono cambiamenti remoti da integrare
        if git fetch --dry-run | grep -q 'refs/heads/'; then
            echo "Trovati aggiornamenti remoti, eseguo pull --rebase per mantenere la storia lineare."
            git pull --rebase
        else
            echo "Nessun aggiornamento remoto. Salto il pull."
        fi
    else
        echo "Nessuna modifica locale nella root. Nessuna azione necessaria."
    fi
}

# Verifica lo stato dei submodules
echo "Verifica stato dei submodules..."
git submodule status | while read -r line; do
    # Estrai il percorso del submodule (dalla riga di output di git submodule status)
    submodule_path=$(echo "$line" | awk '{ print $2 }')

    # Aggiorna il submodule solo se ha modifiche
    update_submodule "$submodule_path"
done

# Aggiorna la root del repository principale
update_root

echo "Aggiornamento completato!"
