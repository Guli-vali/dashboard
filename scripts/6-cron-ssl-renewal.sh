#!/bin/bash
set -e

PROJECT_DIR="/var/www/myapp"
echo "⏰ Добавляем задачу в crontab для автообновления SSL..."

CRON_CMD="cd $PROJECT_DIR && docker-compose run certbot renew --webroot -w /var/www/certbot && docker restart react-nginx"
CRON_JOB="0 3 * * * $CRON_CMD"

( crontab -l 2>/dev/null | grep -v -F "$CRON_CMD" ; echo "$CRON_JOB" ) | crontab -

echo "✅ Cron добавлен: сертификаты будут обновляться каждый день в 3:00."
