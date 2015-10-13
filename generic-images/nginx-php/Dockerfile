FROM webreactor/ubuntu

RUN apt-get -y update && apt-get -y install \
    php5-fpm \
    php5-cli \
    php5-curl \
    php5-mysql \
    php5-memcache \
    php5-mcrypt \
    php5-json \
    php5-curl \
    php5-intl \
    php5-imap \
    php5-gd \
    php5-imagick \
    php5-mysql \
    php5-sqlite \
    nginx

RUN cd /tmp \
    && php -r "readfile('https://getcomposer.org/installer');" | php \
    && mv composer.phar /usr/bin/composer

EXPOSE 80 443

#htdocs folder: /var/www

COPY . /opt/nginx-php

RUN mkdir -p /var/www/ && \
    cp /opt/nginx-php/index.php /var/www/ && \
    rm -f /etc/nginx/sites-enabled/* && \
    cp /opt/nginx-php/default.conf /etc/nginx/sites-enabled/ && \
    chmod a+x /opt/nginx-php/start.sh

WORKDIR /opt/nginx-php

CMD ["./start.sh"]
