#!/bin/bash

. /opt/nginx-php-nxlog/init-env.sh
. /opt/nginx-php-nxlog/nxlog/init-nxlog.sh

supervisord -c /opt/nginx-php-nxlog/supervisor.conf
