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
        
        # Prova a fare il push
        if ! git push; then
            echo "Push fallito per $submodule_path. Provo a risolvere con rebase o merge..."

            # Se il push fallisce, prova a fare il pull --rebase
            if git pull --rebase; then
                echo "Rebase riuscito per $submodule_path. Ora posso fare il push."
                git push
            else
                # Se il rebase fallisce, prova con un merge
                echo "Rebase fallito. Provo a fare un merge..."
                git pull --no-rebase
                git push
            fi
        fi
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
        
        # Prova a fare il push
        if ! git push; then
            echo "Push fallito nella root. Provo a risolvere con rebase o merge..."

            # Se il push fallisce, prova a fare il pull --rebase
            if git pull --rebase; then
                echo "Rebase riuscito nella root. Ora posso fare il push."
                git push
            else
                # Se il rebase fallisce, prova con un merge
                echo "Rebase fallito nella root. Provo a fare un merge..."
                git pull --no-rebase
                git push
            fi
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
