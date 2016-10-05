#!/bin/bash

set -e -v

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

add-apt-repository -y ppa:nginx/development
add-apt-repository -y ppa:ondrej/php

apt-get -y update
apt-get install -y --no-install-recommends \
    nginx \
    php5.5-fpm \
    php5.5-cli \
    php5.5-curl \
    php5.5-mysql \
    php-memcache \
    php-memcached \
    php5.5-mcrypt \
    php5.5-bcmath \
    php5.5-mbstring \
    php5.5-json \
    php5.5-curl \
    php5.5-intl \
    php5.5-imap \
    php5.5-xml \
    php5.5-gd \
    php5.5-imagick \
    php5.5-sqlite \
    php5.5-redis \
    mysql-client

php -r "readfile('https://getcomposer.org/installer');" | php
mv composer.phar /usr/bin/composer

curl -L https://github.com/webreactor/db-migration/releases/download/1.0.2/db-migration > /usr/local/bin/db-migration
chmod a+x /usr/local/bin/db-migration


# Install Nginx, nxlog and PHP FPM configs
mkdir -p /var/www/ /run/php/
cp ./php/index.php /var/www/
rm -f /etc/nginx/sites-enabled/*
cp ./nginx/default         /etc/nginx/sites-enabled/default
cp ./nginx/nginx.conf      /etc/nginx/nginx.conf

cp ./php/owerride*.ini     /etc/php/5.5/mods-available/
cp ./php/www.conf          /etc/php/5.5/fpm/pool.d/www.conf
phpenmod -s cli owerride-php-cli

cp ./nxlog/patterndb.xml   /etc/nxlog/patterndb/patterndb.xml

cp ./php/start-php-fpm /usr/local/bin
cp ./start-nginx-php-nxlog /usr/local/bin

docker-image-cleanup
