#!/bin/sh

spawn-fcgi -p 8080 /fastcgi-server

for i in $(seq 1 5); do
    nc -z 127.0.0.1 8080 && break
    echo "Жду FastCGI-сервер..." && sleep 1
done

nginx -g 'daemon off;'
