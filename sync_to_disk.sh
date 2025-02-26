#!/bin/bash

# Verifica se è stato passato il nome del disco
if [ -z "$1" ]; then
    echo "Uso: $0 <nome_disco>"
    exit 1
fi

DISK_NAME=$1
DEST_PATH="/mnt/$DISK_NAME$PWD"

echo "Sincronizzazione in corso da '$PWD' a '$DEST_PATH'..."

rsync -avz --relative --exclude='.git' --exclude='build' --exclude='cache'  --exclude='storage' --exclude='venv' --exclude='node_modules' --exclude='vendor' ./ "$DEST_PATH"

echo "Sincronizzazione completata!"
