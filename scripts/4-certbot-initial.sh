#!/bin/bash
set -e

DOMAIN="dashbombardilo.ru"
EMAIL="maslievilya1@gmail.com"
PROJECT_DIR="/var/www/myapp"
WEBROOT_PATH="$PROJECT_DIR/certbot/www"
SSL_PATH="$PROJECT_DIR/nginx/ssl"

cd $PROJECT_DIR

echo "📂 Создание директорий для сертификатов..."
mkdir -p "$WEBROOT_PATH"
mkdir -p "$SSL_PATH"

echo "🚀 Запуск временного nginx на 80 порту для валидации..."
docker run --rm -d \
  --name certbot-nginx-temp \
  -v "$WEBROOT_PATH:/usr/share/nginx/html" \
  -p 80:80 \
  nginx:alpine

echo "🔐 Запрос сертификатов от Let's Encrypt..."
docker run --rm \
  -v "$SSL_PATH:/etc/letsencrypt" \
  -v "$WEBROOT_PATH:/var/www/certbot" \
  certbot/certbot certonly \
  --webroot \
  --webroot-path=/var/www/certbot \
  --email $EMAIL \
  --agree-tos \
  --no-eff-email \
  -d $DOMAIN -d www.$DOMAIN

echo "🧹 Остановка временного nginx..."
docker stop certbot-nginx-temp

echo "✅ Сертификат успешно получен и сохранён в $SSL_PATH"