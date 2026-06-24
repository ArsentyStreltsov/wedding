#!/bin/bash
set -euo pipefail

SITE_DIR="/var/www/senya-and-dasha"
REPO_DIR="/home/botapp/wedding"

echo "🚀 Ручной деплой статического сайта senya-and-dasha.ru"
echo "======================================================"

if [ ! -d "$SITE_DIR" ]; then
  echo "❌ Каталог $SITE_DIR не существует. Создайте его (см. docs/MIGRATION_GUIDE.md)."
  exit 1
fi

if [ -d "$REPO_DIR/.git" ]; then
  cd "$REPO_DIR"
  git pull origin main
  rsync -av \
    --exclude '.git/' \
    --exclude '.github/' \
    --exclude 'docs/' \
    --exclude 'scripts/' \
    --exclude 'deploy/' \
    --exclude 'deploy.sh' \
    --exclude '*.mp4' \
    --exclude '.DS_Store' \
    ./ "$SITE_DIR/"
else
  echo "⚠️  Репозиторий не клонирован в $REPO_DIR"
  echo "    Основной способ: git push с Mac → GitHub Actions"
  echo "    Или: scp index.html root@SERVER:/var/www/senya-and-dasha/"
  exit 1
fi

chown -R www-data:www-data "$SITE_DIR"
echo "✅ Деплой завершён: $(ls -la "$SITE_DIR")"
