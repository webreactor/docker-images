FROM webreactor/ubuntu:14.04.03
MAINTAINER Maxim Popov <ad@zalil.ru>

WORKDIR /opt/elk
CMD ./start.sh

EXPOSE 10001 5601 9200
VOLUME /var/lib/elasticsearch/data

# Configs:
# /opt/elasticsearch/config/elasticsearch.yml
# /opt/elk/kibana/kibana.yml
# /opt/elk/logstash/logstash.conf


ADD . /opt/elk

RUN /opt/elk/install.sh
