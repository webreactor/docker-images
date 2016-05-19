#!/usr/bin/env bash

env | grep -v :container | sed -n -r 's/(\w+)=(.+)/define ENV_\1 \2/p' > "/etc/nxlog/env.conf"

if [ -n "$JSON_LOG_SERVER_HOST" ]; then

JSON_LOG_SERVER_PORT=${JSON_LOG_SERVER_PORT:-5000}
JSON_LOG_SERVER_LOG_TYPE=${JSON_LOG_SERVER_LOG_TYPE:-docker}

    while ! nc -z $JSON_LOG_SERVER_HOST $JSON_LOG_SERVER_PORT; do
        echo "Waiting for log server on $JSON_LOG_SERVER_HOST $JSON_LOG_SERVER_PORT"
        sleep 0.1
    done
    sed \
        -e "s/{json-server-host}/${JSON_LOG_SERVER_HOST}/g" \
        -e "s/{json-server-port}/${JSON_LOG_SERVER_PORT}/g" \
        -e "s/{json-server-log-type}/${JSON_LOG_SERVER_LOG_TYPE}/g" \
        /etc/nxlog/json-server.conf.tpl > /etc/nxlog/conf.d/json-server.conf
fi

nxlog
