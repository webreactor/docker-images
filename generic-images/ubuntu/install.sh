#!/bin/bash

set -e -v

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

locale-gen $LC_ALL

apt-get update

apt-get install -y --no-install-recommends \
    git \
    curl \
    wget \
    vim \
    ca-certificates \
    supervisor \
    software-properties-common \
    make \
    less \
    netcat \
    python

apt-get install -y --no-install-recommends \
    libapr1 libdbi1 libperl5.30

mkdir -p /usr/local/etc/nxlog/conf.d/ /usr/local/etc/nxlog/patterndb/
cp ./nxlog/nxlog.conf      /usr/local/etc/nxlog/nxlog.conf
cp ./nxlog/json-server.conf.tpl /usr/local/etc/nxlog/json-server.conf.tpl
cp ./nxlog/docker-log.conf /usr/local/etc/nxlog/conf.d/docker-log.conf
cp ./nxlog/patterndb.xml   /usr/local/etc/nxlog/patterndb/patterndb.xml
cp ./nxlog/start-nxlog /usr/local/bin/

curl -L https://raw.githubusercontent.com/webreactor/wait-for-service/master/wait-for-service > /usr/local/bin/wait-for-service
chmod a+x /usr/local/bin/wait-for-service

cp ./docker-image-cleanup /usr/local/bin/
cp ./nxlog/start-nxlog /usr/local/bin/

docker-image-cleanup
