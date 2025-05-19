#!/bin/bash
set -e

PROJECT_DIR="/var/www/myapp"
GIT_REPO="git@github.com:Guli-vali/dashboard.git"

echo "📁 Клонируем проект в $PROJECT_DIR..."
sudo git clone $GIT_REPO $PROJECT_DIR
cd $PROJECT_DIR

echo "📂 Подготовка директорий для Certbot..."
mkdir -p certbot/www nginx/ssl

echo "✅ Проект склонирован и директории созданы."