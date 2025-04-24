FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    netcat-openbsd \
    build-essential \
    libfcgi-dev \
    nginx \
    procps \
    iproute2 \
    && rm -rf /var/lib/apt/lists/*


COPY /nginx/fastcgi_params /etc/nginx/fastcgi_params

COPY nginx/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
