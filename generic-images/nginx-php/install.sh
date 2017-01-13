#!/bin/bash

set -e -v

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

add-apt-repository -y ppa:nginx/development
add-apt-repository -y ppa:ondrej/php

apt-get -y update
apt-get install -y --no-install-recommends \
    nginx \
    php5.6-fpm \
    php5.6-cli \
    php5.6-curl \
    php5.6-mysql \
    php-memcache \
    php-memcached \
    php5.6-mcrypt \
    php5.6-bcmath \
    php5.6-mbstring \
    php5.6-json \
    php5.6-curl \
    php5.6-intl \
    php5.6-imap \
    php5.6-xml \
    php5.6-gd \
    php5.6-imagick \
    php5.6-sqlite \
    php5.6-redis \
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

cp ./php/owerride*.ini     /etc/php/5.6/mods-available/
cp ./php/www.conf          /etc/php/5.6/fpm/pool.d/www.conf
phpenmod -s cli owerride-php-cli

cp ./nxlog/patterndb.xml   /etc/nxlog/patterndb/patterndb.xml

cp ./php/start-php-fpm /usr/local/bin
cp ./start-nginx-php-nxlog /usr/local/bin

docker-image-cleanup
