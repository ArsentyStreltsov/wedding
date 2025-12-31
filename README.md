# Wedding Save the Date Website

Сайт-приглашение на свадьбу с видео фоном.

## Деплой на GitHub Pages

1. Замените `YOUR_R2_VIDEO_URL_HERE` в `index.html` на реальный URL видео из Cloudflare R2
2. Выполните следующие команды в терминале:

```bash
cd /Users/arsentystreltsov/Desktop/wedding
git init
git add index.html .gitignore README.md
git commit -m "Initial commit: wedding save the date website"
git branch -M main
git remote add origin https://github.com/ArsentyStreltsov/wedding.git
git push -u origin main
```

## Настройка Cloudflare Pages

1. В Cloudflare Dashboard перейдите в "Pages"
2. Нажмите "Create a project" → "Connect to Git"
3. Выберите ваш GitHub репозиторий `wedding`
4. Настройки:
   - Project name: `wedding` (или любое другое)
   - Production branch: `main`
   - Build command: (оставьте пустым)
   - Build output directory: (оставьте пустым)
5. Нажмите "Save and Deploy"

## Важно

- Не забудьте заменить `YOUR_R2_VIDEO_URL_HERE` на реальный URL из Cloudflare R2
- Видео файлы исключены из репозитория через `.gitignore`




