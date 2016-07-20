$!/bin/bash

set -e

add-apt-repository -y ppa:nginx/development
add-apt-repository -y ppa:ondrej/php

apt-get -y update
apt-get install -y --no-install-recommends \
    nginx \
    php5-fpm \
    php5-cli \
    php5-curl \
    php5-mysql \
    php-memcache \
    php-memcached \
    php5-mcrypt \
    php5-json \
    php5-curl \
    php5-intl \
    php5-imap \
    php5-gd \
    php5-imagick \
    php5-sqlite \
    php5-redis \
    mysql-client

cd /tmp
php -r "readfile('https://getcomposer.org/installer');" | php
mv composer.phar /usr/bin/composer

curl -L https://github.com/webreactor/db-migration/releases/download/1.0.2/db-migration > /usr/local/bin/db-migration
chmod a+x /usr/local/bin/db-migration


# Install Nginx, nxlog and PHP FPM configs
mkdir -p /var/www/
cp /opt/nginx-php/php/index.php /var/www/
rm -f /etc/nginx/sites-enabled/*
cp /opt/nginx-php/nginx/default         /etc/nginx/sites-enabled/default
cp /opt/nginx-php/nginx/nginx.conf      /etc/nginx/nginx.conf
cp /opt/nginx-php/php/php.ini           /etc/php5/fpm/php.ini
cp /opt/nginx-php/php/php-fpm.conf      /etc/php5/fpm/php-fpm.conf
cp /opt/nginx-php/php/www.conf          /etc/php5/fpm/pool.d/www.conf
cp /opt/nginx-php/php/php.ini           /etc/php5/cli/php.ini
sed -i 's/error_log/;error_log/g'             /etc/php5/fpm/php.ini
cp /opt/nginx-php/nxlog/patterndb.xml   /etc/nxlog/patterndb/patterndb.xml

/opt/base-image/cleanup.sh
