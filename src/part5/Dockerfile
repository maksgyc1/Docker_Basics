FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    netcat-openbsd \
    build-essential \
    libfcgi-dev \
    spawn-fcgi \
    procps \
    iproute2 \
    && rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --gecos "" appuser

WORKDIR /app

COPY hello.c /app/hello.c

RUN gcc -o /app/fastcgi-server /app/hello.c -lfcgi

RUN chown appuser:appuser /app/fastcgi-server

CMD ["bash", "-c", "spawn-fcgi -n -p 81 /app/fastcgi-server"]
