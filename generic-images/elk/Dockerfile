FROM docker-registry.private.srvcam.com:5000/common/nginx-php-nxlog:v0.0.10
MAINTAINER Blue Team <blueteam@featurecreeptechnology.com>
WORKDIR /opt/elk
CMD start.sh

ENV GOSU_VERSION 1.7
RUN set -x \
    && apt-get update && apt-get install -y --no-install-recommends ca-certificates wget && rm -rf /var/lib/apt/lists/* \
    && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
    && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
    && export GNUPGHOME="$(mktemp -d)" \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
    && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true

RUN apt-get clean && apt-get update \
    && apt-get install -y openjdk-7-jre \
    && mkdir -p /opt/

RUN cd /opt \
    && curl -O https://download.elastic.co/logstash/logstash/logstash-2.3.2.tar.gz \
    && cd /opt && tar -xzf logstash-2.3.2.tar.gz \
    && rm logstash-2.3.2.tar.gz \
    && ln -s logstash-2.3.2 logstash

RUN cd /opt \
    && curl -O https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.3.3/elasticsearch-2.3.3.tar.gz \
    && cd /opt && tar -xzf elasticsearch-2.3.3.tar.gz \
    && rm elasticsearch-2.3.3.tar.gz \
    && ln -s elasticsearch-2.3.3 elasticsearch
    

RUN cd /opt \
    && curl -O https://download.elastic.co/kibana/kibana/kibana-5.0.0-alpha2-linux-x64.tar.gz \
    && tar -xzf kibana-5.0.0-alpha2-linux-x64.tar.gz \
    && rm kibana-5.0.0-alpha2-linux-x64.tar.gz \
    && ln -s kibana-5.0.0-alpha2-linux-x64 kibana-5

RUN cd /opt \
    && curl -O https://download.elastic.co/kibana/kibana/kibana-4.5.1-linux-x64.tar.gz \
    && tar -xzf kibana-4.5.1-linux-x64.tar.gz \
    && rm kibana-4.5.1-linux-x64.tar.gz \
    && ln -s kibana-4.5.1-linux-x64 kibana-4

RUN chown nobody -R /opt/elasticsearch/

ADD . /opt/elk


