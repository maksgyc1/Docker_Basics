#!/bin/sh

# Запускаем FastCGI-сервер в фоне
spawn-fcgi -p 8080 /fastcgi-server

# Ждём, пока порт 8080 станет доступным (до 5 секунд)
for i in $(seq 1 5); do
    nc -z 127.0.0.1 8080 && break
    echo "Жду FastCGI-сервер..." && sleep 1
done

# Запускаем nginx
nginx -g 'daemon off;'
