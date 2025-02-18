#!/bin/sh

MODPACK_URL="https://mediafilez.forgecdn.net/files/6109/390/Fear_Nightfall_Remains_of_Chaos_Server_Pack_v1.0.10.zip"
MODPACK_ZIP="./server-pack.zip"
SERVER_DIR="./data"
TEMP_DIR="./temp_extracted"

echo "🔄 Downloading latest modpack..."
wget -O "$MODPACK_ZIP" "$MODPACK_URL"

rm -rf "$TEMP_DIR"
mkdir -p "$TEMP_DIR"

echo "📦 Extracting modpack..."
unzip -o "$MODPACK_ZIP" -d "$TEMP_DIR"

echo "🔄 Merging extracted files into $SERVER_DIR..."
mkdir -p "$SERVER_DIR"
rsync -av --ignore-existing "$TEMP_DIR/" "$SERVER_DIR/"

chmod +x "$SERVER_DIR/start.sh"

rm -rf "$TEMP_DIR"
rm -f "$MODPACK_ZIP"

echo "✅ Server pack extracted to $SERVER_DIR (existing files were kept)"
