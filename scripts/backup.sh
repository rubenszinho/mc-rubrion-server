#!/bin/bash
echo "💾 Backing up Minecraft world..."
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
mkdir -p /home/mumuzinho/mc-server-cli/backups
docker cp mc_server:/data /home/mumuzinho/mc-server-cli/backups/world_backup_$TIMESTAMP
echo "✅ Backup saved at /home/mumuzinho/mc-server-cli/backups/world_backup_$TIMESTAMP"
