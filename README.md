# Wedding Save the Date Website

Сайт-приглашение на свадьбу с видео-фоном.

**Продакшен:** [https://senya-and-dasha.ru](https://senya-and-dasha.ru)

## Стек

- Статический `index.html`
- Видео — Cloudflare R2 (публичный URL в HTML)
- Хостинг — Hetzner VPS + Nginx
- Автодеплой — GitHub Actions

## Быстрый деплой изменений

```bash
./deploy.sh "Описание изменений"
```

Push в `main` → GitHub Actions копирует файлы на сервер.

## Первичная настройка / миграция с Cloudflare

Инструкции лежат локально в `docs/` (папка в `.gitignore`, на GitHub не попадает).

## GitHub Secrets (Settings → Secrets → Actions)

| Secret | Описание |
| ------ | -------- |
| `SSH_PRIVATE_KEY` | Приватный SSH-ключ для деплоя (целиком, с `BEGIN`/`END`) |
| `SERVER_HOST` | IP вашего VPS |
| `SERVER_USER` | `root` (или другой пользователь с доступом к `/var/www/`) |

## Локальная разработка

Откройте `index.html` в браузере или через любой локальный HTTP-сервер:

```bash
python3 -m http.server 8080
# http://localhost:8080
```

Видео грузится с R2 — нужен интернет.

## Важно

- Видеофайлы (`*.mp4`) в git не попадают — они на R2
- `_redirects` не используется (это было для Cloudflare Pages; на VPS — Nginx `try_files`)
