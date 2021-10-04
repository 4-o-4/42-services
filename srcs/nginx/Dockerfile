FROM alpine:3.12

RUN apk update && \
    apk --update --no-cache add \
    nginx \
    openssl \
    supervisor

COPY supervisord.conf /etc/supervisord.conf

COPY index.html /var/www/index.html

RUN mkdir -p /run/nginx && \
    \
    openssl req -x509 -newkey rsa:2048 -nodes -sha256 \
    -keyout /etc/ssl/certs/localhost.key \
    -out /etc/ssl/certs/localhost.crt \
    -subj "/CN=localhost"

EXPOSE 80 443

CMD ["supervisord", "-c", "/etc/supervisord.conf"]
