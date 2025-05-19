#!/bin/bash
set -e

PROJECT_DIR="/var/www/myapp"
cd $PROJECT_DIR

echo "🚀 Сборка и запуск приложения в фоне..."
docker compose up --build -d

echo "✅ Приложение запущено."