FROM alpine:3.12

RUN apk update && \
    apk --update --no-cache add \
    openssl \
    supervisor \
    vsftpd

RUN echo 'root:root' | chpasswd && \
    \
    openssl req -x509 -newkey rsa:2048 -nodes -sha256 \
    -keyout /etc/ssl/private/vsftpd.key \
    -out /etc/ssl/certs/vsftpd.crt \
    -subj "/CN=localhost"

COPY conf/supervisord.conf /etc/supervisord.conf

EXPOSE 21 30021

CMD ["supervisord", "-c", "/etc/supervisord.conf"]
