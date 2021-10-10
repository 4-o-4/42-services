FROM alpine:3.12

RUN apk update && \
    apk --update --no-cache add \
    nginx \
    php7 \
    php7-fpm \
    php7-json \
    php7-mysqli \
    supervisor \
    wget

RUN mkdir -p /run/nginx && \
    \
    wget --quiet https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz > /dev/null && \
    rm -rf latest.tar.gz && \
    mkdir -p /var/www && \
    mv wordpress/ /var/www/wordpress && \
    \
    cd /var/www/wordpress && \
    sed -e "s/database_name_here/wordpress/" \
        -e "s/username_here/gplaid/" \
        -e "s/password_here/iegah9Ah/" \
        -e "s/localhost/mysql-service/" \
        wp-config-sample.php > wp-config.php

COPY conf/supervisord.conf /etc/supervisord.conf

EXPOSE 5050

CMD ["supervisord", "-c", "/etc/supervisord.conf"]
