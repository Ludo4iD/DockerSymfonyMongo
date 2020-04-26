#!/bin/sh

sed -i "s|{APP_ENV}|${APP_ENV}|" /etc/php7/php-fpm.d/symfony.pool.conf
sed -i "s|{MONGO_HOST}|${MONGO_HOST}|" /etc/php7/php-fpm.d/symfony.pool.conf
sed -i "s|{MONGO_DB}|${MONGO_DB}|" /etc/php7/php-fpm.d/symfony.pool.conf

exec "$@"
