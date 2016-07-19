$!/bin/bash

set -e

add-apt-repository -y ppa:nginx/development
add-apt-repository -y ppa:ondrej/php

apt-get -y update
apt-get install -y --no-install-recommends \
    nginx \
    php5.6-fpm \
    php5.6-cli \
    php5.6-curl \
    php5.6-mysql \
    php5.6-memcache \
    php5.6-memcached \
    php5.6-mcrypt \
    php5.6-json \
    php5.6-curl \
    php5.6-intl \
    php5.6-imap \
    php5.6-gd \
    php5.6-imagick \
    php5.6-sqlite \
    php5.6-redis \
    mysql-client

cd /tmp
php -r "readfile('https://getcomposer.org/installer');" | php
mv composer.phar /usr/bin/composer

curl -L https://github.com/webreactor/db-migration/releases/download/1.0.1/db-migration > /usr/local/bin/db-migration
chmod a+x /usr/local/bin/db-migration


# Install Nginx, nxlog and PHP FPM configs
mkdir -p /var/www/
cp /opt/nginx-php/php/index.php /var/www/
rm -f /etc/nginx/sites-enabled/*
cp /opt/nginx-php/nginx/default         /etc/nginx/sites-enabled/default
cp /opt/nginx-php/nginx/nginx.conf      /etc/nginx/nginx.conf
cp /opt/nginx-php/php/php.ini           /etc/php/5.6/fpm/php.ini
cp /opt/nginx-php/php/php-fpm.conf      /etc/php/5.6/fpm/php-fpm.conf
cp /opt/nginx-php/php/www.conf          /etc/php/5.6/fpm/pool.d/www.conf
cp /opt/nginx-php/php/php.ini           /etc/php/5.6/cli/php.ini
sed -i 's/error_log/;error_log/g'             /etc/php/5.6/fpm/php.ini
cp /opt/nginx-php/nxlog/patterndb.xml   /etc/nxlog/patterndb/patterndb.xml

/opt/base-image/cleanup.sh
