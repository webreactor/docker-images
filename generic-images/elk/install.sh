$!/bin/bash

set -e

cd /opt

GOSU_VERSION=1.6
set -x

apt-get update
curl -L "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" > /usr/local/bin/gosu
chmod +x /usr/local/bin/gosu
gosu nobody true

apt-get install -y openjdk-7-jre


curl -L -O https://download.elastic.co/logstash/logstash/logstash-2.3.2.tar.gz
tar -xzf logstash-2.3.2.tar.gz
rm logstash-2.3.2.tar.gz
ln -s logstash-2.3.2 logstash


curl -L -O https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.3.3/elasticsearch-2.3.3.tar.gz
tar -xzf elasticsearch-2.3.3.tar.gz
rm elasticsearch-2.3.3.tar.gz
ln -s elasticsearch-2.3.3 elasticsearch
chown nobody -R /opt/elasticsearch/


curl -L -O https://download.elastic.co/kibana/kibana/kibana-5.0.0-alpha2-linux-x64.tar.gz
tar -xzf kibana-5.0.0-alpha2-linux-x64.tar.gz
rm kibana-5.0.0-alpha2-linux-x64.tar.gz
ln -s kibana-5.0.0-alpha2-linux-x64 kibana-5


curl -L -O https://download.elastic.co/kibana/kibana/kibana-4.5.1-linux-x64.tar.gz
tar -xzf kibana-4.5.1-linux-x64.tar.gz
rm kibana-4.5.1-linux-x64.tar.gz
ln -s kibana-4.5.1-linux-x64 kibana-4

cp /opt/elk/elasticsearch/elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml

/opt/base-image/cleanup.sh
