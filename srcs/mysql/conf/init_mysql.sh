#!/bin/sh

openrc > /dev/null 2>&1
touch /run/openrc/softlevel

service mariadb setup > /dev/null 2>&1
service mariadb start > /dev/null 2>&1

mysql -e "CREATE DATABASE wordpress; \
GRANT ALL PRIVILEGES ON wordpress.* TO 'gplaid'@'%' IDENTIFIED BY 'iegah9Ah'; \
FLUSH PRIVILEGES;"

if [ ! -f /var/lib/mysql/wordpress ]; then
    mysql wordpress < wordpress.sql
fi

service mariadb stop

supervisord -c /etc/supervisord.conf
