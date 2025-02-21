#!/bin/sh

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
