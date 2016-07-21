FROM webreactor/ubuntu:14.04.03

# htdocs folder: /var/www

WORKDIR /var/www
EXPOSE 80 443
CMD "start-nginx-php-nxlog"

ADD . /opt/nginx-php

RUN /opt/nginx-php/install.sh
