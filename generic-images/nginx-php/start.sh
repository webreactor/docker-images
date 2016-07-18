#!/bin/bash

. /opt/nginx-php/init-env.sh
. /opt/base-image/init-nxlog.sh

php5-fpm

nginx

nxlog -f
