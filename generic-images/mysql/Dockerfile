FROM webreactor/ubuntu:14.04.02

ENV MYSQL_VERSION 5.5
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
	&& apt-get install -yq mysql-server-$MYSQL_VERSION

EXPOSE 3306

VOLUME ["/var/lib/mysql"]

CMD ["/opt/mysql/run.sh"]

RUN curl -L https://github.com/webreactor/db-migration/releases/download/1.0.1/db-migration > /usr/local/bin/db-migration \
    && chmod a+x /usr/local/bin/db-migration

ADD . /opt/mysql
