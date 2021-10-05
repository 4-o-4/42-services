FROM alpine:3.12

RUN apk update && \
    apk --update --no-cache add \
    mysql \
    mysql-client \
    openrc \
    supervisor

COPY conf/supervisord.conf /etc/supervisord.conf
COPY conf/init_mysql.sh conf/wordpress.sql /

EXPOSE 3306

CMD ["sh", "init_mysql.sh"]
