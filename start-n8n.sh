#!/bin/bash

# =======================================================================
# 1. LAUNCH DOCKER DESKTOP
# =======================================================================
echo "🚀 Launching Docker Desktop..."
start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"

# Wait 20 seconds to give the Docker engine enough time to boot up completely
echo "⏳ Waiting for Docker daemon to initialize..."
sleep 20

# =======================================================================
# 2. CLEAN UP OLD DOCKER DATA
# =======================================================================
echo "🧹 Cleaning up old Docker containers and volumes..."
docker compose down
docker system prune -f

# =======================================================================
# 3. START NGROK TUNNEL (STATIC DOMAIN)
# =======================================================================
# WARNING: Replace 'your-name.ngrok-free.app' with your real static domain!
echo "🌐 Starting Ngrok background tunnel..."
ngrok http 5678 --domain=jasmine-shelf-douche.ngrok-free.dev > /dev/null &

# Wait 3 seconds for the ngrok tunnel connection to stabilize
sleep 3

# =======================================================================
# 4. LAUNCH N8N CONTAINERS
# =======================================================================
echo "🐳 Launching your modified n8n stack..."
docker compose up -d

echo "✅ Setup complete! Your environment is running."
echo "🔗 Access your webhook at: https://jasmine-shelf-douche.ngrok-free.dev"