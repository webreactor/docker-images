#!/bin/bash

. /opt/nginx-php-nxlog/init-env.sh
. /opt/nginx-php-nxlog/nxlog/init-nxlog.sh

php5-fpm

nginx
