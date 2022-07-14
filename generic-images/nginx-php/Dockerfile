FROM webreactor/ubuntu:20.04.01

# htdocs folder: /var/www

WORKDIR /var/www
EXPOSE 80 443
CMD "start-nginx-php-nxlog"

ADD . /opt/nginx-php

RUN /opt/nginx-php/install.sh
