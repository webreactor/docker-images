#!/bin/bash

chmod a+w -R /var/lib/elasticsearch/data

/usr/bin/supervisord -n -c /opt/elk/supervisord.conf

