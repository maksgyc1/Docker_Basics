# Используем базовый образ с Debian
FROM debian:bookworm

# Устанавливаем необходимые пакеты
RUN apt-get update && apt-get install -y \
    netcat-openbsd \
    build-essential \
    libfcgi-dev \
    spawn-fcgi \
    nginx \
    procps \
    && rm -rf /var/lib/apt/lists/*

# Добавим пользователя
RUN adduser --disabled-password --gecos "" appuser

# Копируем исходники мини-сервера и nginx конфигурацию
COPY hello.c /hello.c
COPY nginx /etc/nginx

# Компилируем мини-сервер
RUN gcc -o /fastcgi-server /hello.c -lfcgi

# Настроим nginx
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Запуск mini-сервера на порту 8080 через spawn-fcgi
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]

# Переключаемся на пользователя
USER appuser
