#!/bin/bash
echo "🔄 Restarting Minecraft Server..."
cd /home/mumuzinho/mc-server-cli && docker-compose down && docker-compose up -d
