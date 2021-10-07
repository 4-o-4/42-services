FROM alpine:3.12

RUN apk update && \
    apk --update --no-cache add \
    fcgi \
    mysql-client \
    nginx \
    openssl \
    php7 php7-cgi php7-common php7-ctype \
    php7-curl php7-dom php7-fpm php7-gd php7-gettext php7-iconv \
    php7-imap php7-json php7-ldap php7-mbstring php7-mcrypt php7-mysqli \
    php7-pdo php7-pdo_mysql php7-posix php7-session php7-soap php7-xml \
    php7-xmlrpc \
    supervisor \
    wget

RUN mkdir -p /run/nginx && \
    \
    wget --quiet https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz && \
    tar -xzvf phpMyAdmin-5.0.4-all-languages.tar.gz > /dev/null && \
    rm -rf phpMyAdmin-5.0.4-all-languages.tar.gz && \
    mv phpMyAdmin-5.0.4-all-languages/ /var/www/phpmyadmin && \
    mkdir -p /var/www/phpmyadmin/tmp && \
    \
    cd /var/www/phpmyadmin && \
    sed -e "s/cfg\['blowfish_secret'\] = ''/cfg['blowfish_secret'] = 'oonie2teer5die7uowequi6AhZ1aezah'/" \
        -e "s/localhost/mysql-service:3306/" \
        *.inc.php > config.inc.php && \
        echo "\$cfg['TempDir'] = '/tmp';" >> config.inc.php && \
    \
    openssl req -x509 -newkey rsa:2048 -nodes -sha256 \
    -keyout /etc/ssl/certs/localhost.key \
    -out /etc/ssl/certs/localhost.crt \
    -subj "/CN=localhost"

COPY conf/supervisord.conf /etc/supervisord.conf

EXPOSE 5000

CMD ["supervisord", "-c", "/etc/supervisord.conf"]
