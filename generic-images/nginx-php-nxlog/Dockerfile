FROM webreactor/ubuntu:14.04.03

# htdocs folder: /var/www

WORKDIR /opt/nginx-php-nxlog
EXPOSE 80 443
CMD "/opt/nginx-php-nxlog/start.sh"

ADD . /opt/nginx-php-nxlog

RUN /opt/nginx-php-nxlog/install.sh
