FROM webreactor/ubuntu:14.04.03

# htdocs folder: /var/www

WORKDIR /opt/nginx-php
EXPOSE 80 443
CMD "/opt/nginx-php/start.sh"

ADD . /opt/nginx-php

RUN /opt/nginx-php/install.sh
