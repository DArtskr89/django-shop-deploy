# Онлайн магазин

Проект подготовлен для запуска в Docker с использованием Pipenv.

## Локальный запуск

```powershell
docker compose up --build
```

После запуска приложение доступно по адресу:

```text
http://127.0.0.1:8000/
```

Остановка контейнера:

```powershell
docker compose down
```

## Подключение к серверу по SSH

Создание ключа на локальном компьютере:

```powershell
ssh-keygen -t ed25519
```

Публичный ключ из файла `~/.ssh/id_ed25519.pub` необходимо добавить на сервер. Подключение выполняется командой:

```powershell
ssh root@SERVER_IP
```

## Запуск на сервере

На сервере должны быть установлены Git, Docker и Docker Compose. Затем нужно клонировать публичный репозиторий и запустить приложение:

```bash
git clone REPOSITORY_URL
cd REPOSITORY_DIRECTORY
docker compose up --build -d
```

Проверка состояния контейнера:

```bash
docker compose ps
```

Просмотр журналов:

```bash
docker compose logs -f
```

В `docker-compose.yml` установлены `DJANGO_DEBUG=1` и политика перезапуска `restart: always`. Приложение открывается по адресу `http://SERVER_IP:8000/`.
