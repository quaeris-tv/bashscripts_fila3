#!/bin/bash

# Verifica se è stato passato il nome del disco
if [ -z "$1" ]; then
    echo "Uso: $0 <nome_disco>"
    exit 1
fi

DISK_NAME=$1
<<<<<<< HEAD
TIMESTAMP=$(date +"%Y%m%d-%H%M")  # Formato YYYYMMDD-HHMM
ARCHIVE_NAME="$(basename "$PWD")_$TIMESTAMP.tar.gz"

# Percorso temporaneo per creare il backup dentro WSL
TEMP_PATH="/tmp/$ARCHIVE_NAME"

# Percorso finale su disco esterno (cartella fissa, senza ricostruire il path)
DEST_PATH="/mnt/$DISK_NAME/var/www/html/_bases/$ARCHIVE_NAME"

echo "📂 Sincronizzazione in corso..."
echo "📝 Creazione dell'archivio temporaneo in: $TEMP_PATH"

# Rimuove i file *:Zone.Identifier
find . -type f -name "*:Zone.Identifier" -delete

# Crea il tar.gz dentro WSL con massima compressione
tar -czf "$TEMP_PATH" --exclude='.git' --exclude='build' --exclude='cache' --exclude='storage' \
    --exclude='venv' --exclude='node_modules' --exclude='vendor' --exclude='stubs' \
    --exclude='.git-rewrite' .

# Controllo errore creazione tar
if [ $? -eq 0 ]; then
    echo "✅ Archivio creato con successo: $TEMP_PATH"
else
    echo "❌ Errore nella creazione dell'archivio"
    exit 1
fi

# Crea la directory di destinazione se non esiste
mkdir -p "$(dirname "$DEST_PATH")"

# Sposta il file nel disco esterno
mv "$TEMP_PATH" "$DEST_PATH"

# Controllo errore spostamento
if [ $? -eq 0 ]; then
    echo "🎉 Backup completato con successo: $DEST_PATH"
else
    echo "❌ Errore durante lo spostamento del file nel disco esterno"
    exit 1
fi
=======
DEST_PATH="/mnt/$DISK_NAME$PWD"
me=$( readlink -f -- "$0";)

echo "Sincronizzazione in corso da '$PWD' a '$DEST_PATH'..."
find . -type f -name "*:Zone.Identifier" -exec rm -f {} \;
rsync -avz --relative --exclude='.git' --exclude='build' --exclude='cache'  --exclude='storage' --exclude='venv' --exclude='node_modules' --exclude='vendor' --exclude='stubs' ./ "$DEST_PATH"
sed -i -e 's/\r$//' "$me"
echo "Sincronizzazione completata!"
>>>>>>> 26ad934e5 (first)
