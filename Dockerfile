FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIPENV_VENV_IN_PROJECT=0

WORKDIR /app

RUN pip install --no-cache-dir pipenv==2024.4.0

COPY Pipfile Pipfile.lock ./
RUN pipenv sync --system

COPY . .
RUN chmod +x /app/entrypoint.sh

WORKDIR /app/mysite

EXPOSE 8000

ENTRYPOINT ["/app/entrypoint.sh"]
