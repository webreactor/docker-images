#!/bin/bash

chmod a+w -R /var/lib/elasticsearch/data

/opt/elk/elastic-init.sh &

/usr/bin/supervisord -n -c /opt/elk/supervisord.conf
