FROM webreactor/ubuntu:14.04.02

# htdocs folder: /var/www

WORKDIR /opt/nginx-php-nxlog
EXPOSE 80 443
CMD ["./start.sh"]

RUN curl -k -L http://toolbox.fctechno.com/webdav/deb/nxlog-ce_2.9.1347_ubuntu_1404_amd64.deb -o nxlog.deb; \
    dpkg -i nxlog.deb; \
    apt-get -f -y install

RUN add-apt-repository -y ppa:nginx/development \
    && apt-get -y update \
    && apt-get -y install nginx

RUN add-apt-repository ppa:ondrej/php5 \
    && apt-get -y update \
    && apt-get -y install \
    php5-fpm \
    php5-cli \
    php5-curl \
    php5-mysql \
    php5-memcache \
    php5-memcached \
    php5-mcrypt \
    php5-json \
    php5-curl \
    php5-intl \
    php5-imap \
    php5-gd \
    php5-imagick \
    php5-mysql \
    php5-sqlite
    
RUN cd /tmp \
    && php -r "readfile('https://getcomposer.org/installer');" | php \
    && mv composer.phar /usr/bin/composer


COPY . /opt/nginx-php-nxlog

CMD /opt/nginx-php-nxlog/start.sh

ADD . /opt/nginx-php-nxlog

# Install Nginx, nxlog and PHP FPM configs
RUN mkdir -p /var/www/ \
    && cp /opt/nginx-php-nxlog/php/index.php /var/www/ \
    && rm -f /etc/nginx/sites-enabled/* \
    && cp /opt/nginx-php-nxlog/nginx/default         /etc/nginx/sites-enabled/default \
    && cp /opt/nginx-php-nxlog/nginx/nginx.conf      /etc/nginx/nginx.conf \
    && cp /opt/nginx-php-nxlog/php/php.ini           /etc/php5/fpm/php.ini \
    && cp /opt/nginx-php-nxlog/php/php-fpm.conf      /etc/php5/fpm/php-fpm.conf \
    && cp /opt/nginx-php-nxlog/php/www.conf          /etc/php5/fpm/pool.d/www.conf \
    && cp /opt/nginx-php-nxlog/php/php.ini           /etc/php5/cli/php.ini \
    && sed -i 's/error_log/;error_log/g'                 /etc/php5/fpm/php.ini \
    && cp /opt/nginx-php-nxlog/nxlog/nxlog.conf      /etc/nxlog/nxlog.conf \
    && mkdir -p /etc/nxlog/conf.d/ \
    && cp /opt/nginx-php-nxlog/nxlog/json-server.conf.tpl /etc/nxlog/json-server.conf.tpl \
    && cp /opt/nginx-php-nxlog/nxlog/docker-log.conf /etc/nxlog/conf.d/docker-log.conf \
    && cp /opt/nginx-php-nxlog/nxlog/patterndb.xml   /etc/nxlog/patterndb.xml
