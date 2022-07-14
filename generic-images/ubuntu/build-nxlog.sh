#!/bin/bash

apt-get update && apt-get install -y \
  build-essential \
  libapr1-dev \
  libpcre3-dev \
  libssl-dev \
  libexpat1-dev

mkdir /root/nxlog
pushd /root/nxlog
wget https://nxlog.co/system/files/products/files/348/nxlog-ce-2.11.2190.tar.gz
tar zxkf nxlog-ce-2.11.2190.tar.gz
cd nxlog-ce-2.11.13
./configure && make && make install && echo "nxlog has build ok"
popd
