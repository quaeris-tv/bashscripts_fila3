#!/bin/bash

# Colori per migliorare la leggibilità
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
RED=$(tput setaf 1)
RESET=$(tput sgr0)

# Controllo parametri
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "${RED}Errore: Specificare organizzazione e branch.${RESET}"
    echo "${YELLOW}Uso: $0 <nuova-organizzazione> <branch>${RESET}"
    exit 1
fi

NEW_ORG=$1
BRANCH=$2
SCRIPT_PATH=$(readlink -f -- "$0")
WHERE=$(pwd)

# Controllo se siamo in una repo Git
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "${RED}Errore: Questo script deve essere eseguito all'interno di una repository Git!${RESET}"
    exit 1
fi

echo "${YELLOW}==> Aggiornamento submodules...${RESET}"
#git submodule update --progress --init --recursive --merge --rebase --remote
git submodule foreach "$SCRIPT_PATH" "$NEW_ORG" "$BRANCH"

echo "${YELLOW}==> Controllo configurazioni Git...${RESET}"

# Configurazioni Git per evitare problemi
git config core.fileMode false
git config advice.skippedCherryPicks false
git config core.autocrlf input
git config core.ignorecase false

# Assicuriamoci di essere sul branch corretto
if ! git checkout "$BRANCH" -- 2>/dev/null; then
    echo "${YELLOW}Branch '$BRANCH' non trovato. Creazione...${RESET}"
    git checkout -b "$BRANCH"
fi

echo "${GREEN}✔ Branch attivo: $BRANCH${RESET}"



echo "${YELLOW}==> Normalizzazione e commit delle modifiche...${RESET}"
git add --renormalize -A
if git commit -am "Auto-sync"; then
    echo "${GREEN}✔ Modifiche committate${RESET}"
else
    echo "${YELLOW}⚠ Nessuna modifica da committare${RESET}"
fi

echo "${YELLOW}==> Push su remoto...${RESET}"
if ! git push origin HEAD:"$BRANCH" -u --progress 'origin'; then
    echo "${YELLOW}⚠ Tentativo di push alternativo...${RESET}"
    git push --set-upstream origin "$BRANCH"
fi
echo "${GREEN}✔ Push completato${RESET}"

# Imposta il tracking del branch remoto
git branch --set-upstream-to=origin/$BRANCH $BRANCH
git branch -u origin/$BRANCH


echo "${YELLOW}==> Pull con autostash...${RESET}"
git pull origin "$BRANCH" --autostash --recurse-submodules --allow-unrelated-histories --prune --progress -v --rebase
echo "${GREEN}✔ Pull completato${RESET}"

echo "${YELLOW}==> Merge locale per garantire allineamento...${RESET}"
git merge "$BRANCH" || echo "${YELLOW}⚠ Merge già aggiornato${RESET}"


sed -i -e 's/\r$//' "$SCRIPT_PATH"
echo "${GREEN}========= SYNC COMPLETATA CON SUCCESSO [$WHERE ($BRANCH)] =========${RESET}"
