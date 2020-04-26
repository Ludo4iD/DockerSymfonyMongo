FROM alpine:3.11

RUN apk add --update \
    php7-ctype \
    php7-curl \
    php7-dom \
    #php7-fileinfo \
    php7-fpm \
    php7-iconv \
    #php7-intl \
    php7-json \
    php7-mbstring \
    php7-openssl \
    php7-pdo \
    php7-phar \
    php7-session \
    php7-simplexml \
    php7-tokenizer \
    php7-xdebug \
    php7-xml \
    php7-xmlwriter \
    php7-zip \
    curl \
    tzdata

RUN apk add --no-cache yarn git

# Installation du driver MongoDB
RUN apk add --no-cache php7-pear php7-dev gcc g++ make
RUN pecl install mongodb
RUN echo "extension=mongodb.so" >>  /etc/php7/conf.d/mongodb.ini

# Installation de composer
RUN rm -rf /var/cache/apk/* && rm -rf /tmp/* && \
    curl --insecure https://getcomposer.org/composer-stable.phar -o /usr/bin/composer && chmod +x /usr/bin/composer

ADD symfony.ini /etc/php7/conf.d/
ADD symfony.ini /etc/php7/cli/conf.d/

ADD symfony.pool.conf /etc/php7/php-fpm.d/

# Préparation de l'entrypoint pour mettre à jour les variables d'environnement
COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 755 /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["php-fpm7", "-F"]

WORKDIR /var/www/app
EXPOSE 9001
