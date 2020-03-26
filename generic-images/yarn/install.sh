#!/bin/bash

set -e -v

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

locale-gen $LC_ALL

curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n
chmod a+x n
mv n /usr/local/bin/n

n v10.8.0

npm config set strict-ssl false

npm install -g yarn@1.22.4

