#!/bin/bash

set -e

locale-gen $LC_ALL

apt-get update

apt-get install -y \
    git \
    curl \
    wget \
    vim \
    ca-certificates \
    supervisor \
    software-properties-common \
    make

apt-get install -y \
    libapr1 libdbi1 libperl5.18

curl -k -L https://nxlog.co/system/files/products/files/1/nxlog-ce_2.9.1716_ubuntu_1404_amd64.deb -o nxlog.deb
dpkg -i nxlog.deb
apt-get -f -y install

curl -L https://raw.githubusercontent.com/webreactor/wait-for-service/master/wait-for-service > /usr/local/bin/wait-for-service
chmod a+x /usr/local/bin/wait-for-service

/opt/base-image/cleanup.sh
