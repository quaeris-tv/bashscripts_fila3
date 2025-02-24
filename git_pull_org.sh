#!/bin/sh

<<<<<<< HEAD
# Controllo parametri
if [ "$#" -ne 2 ]; then
    echo "Utilizzo: $0 <nuova-organizzazione> <branch>"
    exit 1
fi

NEW_ORG="$1"
BRANCH="$2"

# Nome dello script stesso per la chiamata ricorsiva
ME=$(readlink -f -- "$0")
WHERE=$(pwd)

# Ottiene il nome della repository corrente
REPO_NAME=$(basename "$(git rev-parse --show-toplevel)")

# Costruisce il nuovo URL remoto
#NEW_REMOTE="https://github.com/$NEW_ORG/$REPO_NAME.git"
NEW_REMOTE="git@github.com:$NEW_ORG/$REPO_NAME.git"


echo "📥 [MAIN] Pull da $NEW_REMOTE (branch: $BRANCH)"

# Aggiornamento submoduli
git submodule update --progress --init --recursive --force --merge --rebase --remote
git submodule foreach "$ME" "$NEW_ORG" "$BRANCH"

# Configurazione Git
git config core.fileMode false
git add --renormalize -A

# Commit automatico se ci sono modifiche
git add -A && git commit -am "Auto-update" || echo "⚠️  Nessuna modifica da committare"

# Push verso il branch remoto
git push origin "$BRANCH" -u --progress 'origin' || git push --set-upstream origin "$BRANCH"

echo "✅ PUSH COMPLETATO [$WHERE ($BRANCH)]"

# Checkout del branch corretto
git checkout "$BRANCH" --
git branch --set-upstream-to=origin/"$BRANCH" "$BRANCH"
git branch -u origin/"$BRANCH"
git merge "$BRANCH"

echo "✅ MERGE COMPLETATO [$WHERE ($BRANCH)]"

# Aggiornamento finale dei submoduli e pull dalla nuova organizzazione
git submodule update --progress --init --recursive --force --merge --rebase --remote
git checkout "$BRANCH" --
git pull "$NEW_REMOTE" "$BRANCH" --autostash --recurse-submodules --allow-unrelated-histories --prune --progress -v --rebase

echo "✅ PULL COMPLETATO [$WHERE ($BRANCH)]"
=======
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <organization> <branch>"
    exit 1
fi

org="$1"
branch="$2"
repo_name=$(basename "$(git rev-parse --show-toplevel)")
script_path=$(readlink -f -- "$0")
where=$(pwd)

echo "-------- START SYNC [$where ($branch) - ORG: $org] ----------"

# 1️⃣ Configurazioni globali per evitare problemi
git config core.fileMode false
git config core.ignorecase false
git config advice.skippedCherryPicks false

# 2️⃣ Sincronizziamo i submoduli PRIMA di lavorare sul repository principale
git submodule sync --recursive
git submodule update --progress --init --recursive --force --merge --rebase --remote
git submodule foreach "$script_path" "$org" "$branch"

# 3️⃣ Sincronizziamo il repository principale
git fetch origin --progress --prune
if git show-ref --verify --quiet refs/heads/"$branch"; then
    git checkout "$branch"
else
    git checkout -t origin/"$branch" || git checkout -b "$branch"
fi

# 4️⃣ Pull con gestione dei conflitti
git pull --rebase origin "$branch" --autostash --recurse-submodules --allow-unrelated-histories --prune --progress -v || {
    echo "Rebase failed, attempting conflict resolution..."
    
    # 🔄 Tentiamo di continuare il rebase automaticamente
    if git rebase --continue; then
        echo "Rebase continued successfully."
    else
        echo "Rebase conflicts detected. Attempting automatic resolution..."

        # 🛠 Risolviamo automaticamente i conflitti prendendo la versione remota
        git diff --name-only --diff-filter=U | while read file; do
            git checkout --theirs "$file"
            git add "$file"
        done

        # 🛠 Proviamo a completare il rebase
        git rebase --continue || {
            echo "Rebase auto-fix failed. Aborting..."
            git rebase --abort
            echo "Attempting merge instead..."
            git merge origin/$branch || {
                echo "Merge also failed. Manual intervention required!"
                exit 1
            }
        }
    fi
}

# 5️⃣ Normalizziamo i file e committiamo se ci sono modifiche
git add --renormalize -A
git commit -am "sync update" || echo '--------------------------- No changes to commit'

# 6️⃣ Push delle modifiche con retry
git push origin "$branch" --progress || {
    echo "Push failed, attempting rebase and retry..."
    git pull --rebase origin "$branch" && git push origin "$branch"
}

echo "-------- END PUSH [$where ($branch)] ----------"

# 7️⃣ Configuriamo il tracking del branch, se necessario
if ! git rev-parse --abbrev-ref --symbolic-full-name "@{u}" >/dev/null 2>&1; then
    git branch --set-upstream-to=origin/$branch "$branch" || true
    git branch -u origin/$branch || true
fi

echo "-------- END SYNC [$where ($branch) - ORG: $org] ----------"
>>>>>>> d759193df0de6dfc712e390ca2f9e6f9b617d838
