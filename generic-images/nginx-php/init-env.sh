#!/bin/bash

chmod a+w -R /var/log
chmod a+w -R /tmp

echo "Generating php-fpm conf"
env
php /opt/nginx-php-nxlog/php/add-env-to-php-fpm.php
