#!/bin/bash
set -e

# === Конфигурация ===
PROJECT_DIR="/var/www/myapp"
DOMAIN="dashbombardilo.ru"
LOG_FILE="/var/log/ssl-renew.log"

# === Установка cron, если нужно ===
if ! command -v crontab >/dev/null 2>&1; then
  echo "📦 Установка cron..."
  sudo apt update
  sudo apt install -y cron
fi

# === Запуск cron, если не активен ===
if ! sudo systemctl is-active --quiet cron; then
  echo "🚀 Запуск службы cron..."
  sudo systemctl enable cron
  sudo systemctl start cron
fi

# === Команда для продления SSL ===
CRON_COMMAND="docker run --rm -v \"$PROJECT_DIR/nginx/ssl:/etc/letsencrypt\" certbot/certbot renew --quiet --no-self-upgrade && docker compose -f $PROJECT_DIR/docker-compose.yml exec nginx nginx -s reload >> $LOG_FILE 2>&1"

# === Проверка и добавление задачи ===
if crontab -l 2>/dev/null | grep -F "$CRON_COMMAND" >/dev/null; then
  echo "ℹ️ Cron-задача уже существует. Ничего не добавлено."
else
  ( crontab -l 2>/dev/null; echo "0 4 * * * $CRON_COMMAND" ) | crontab -
  echo "✅ Задача добавлена в crontab: ежедневное продление SSL в 04:00"
fi
