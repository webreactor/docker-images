#!/bin/bash

set -e -v

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#add-apt-repository -y ppa:nginx/development
add-apt-repository -y ppa:ondrej/php

apt-get -y update && apt-get install -y --no-install-recommends \
    nginx \
    php7.2-fpm \
    php7.2-cli \
    php7.2-curl \
    php7.2-mysql \
    php-memcache \
    php-memcached \
    php7.2-mcrypt \
    php7.2-bcmath \
    php7.2-mbstring \
    php7.2-json \
    php7.2-curl \
    php7.2-intl \
    php7.2-imap \
    php7.2-xml \
    php7.2-gd \
    php7.2-imagick \
    php7.2-sqlite \
    php7.2-redis \
    mysql-client

php -r "readfile('https://getcomposer.org/installer');" | php
mv composer.phar /usr/bin/composer

# временно даунгрейдимся до версии 1, т.к. для 2 нужно поправить имена пакетов
composer self-update 1.10.16

curl -L https://github.com/webreactor/db-migration/releases/download/1.0.2/db-migration > /usr/local/bin/db-migration
chmod a+x /usr/local/bin/db-migration


# Install Nginx, nxlog and PHP FPM configs
mkdir -p /var/www/ /run/php/
cp ./php/index.php /var/www/
rm -f /etc/nginx/sites-enabled/*
cp ./nginx/default         /etc/nginx/sites-enabled/default
cp ./nginx/nginx.conf      /etc/nginx/nginx.conf

cp ./php/owerride*.ini     /etc/php/5.6/mods-available/
cp ./php/www.conf          /etc/php/5.6/fpm/pool.d/www.conf
phpenmod -v 5.6 -s cli owerride-php-cli

cp ./nxlog/patterndb.xml   /usr/local/etc/nxlog/patterndb/patterndb.xml

cp ./php/start-php-fpm /usr/local/bin
cp ./start-nginx-php-nxlog /usr/local/bin

apt-get clean
