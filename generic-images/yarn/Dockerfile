FROM webreactor/ubuntu:14.04.03

RUN sudo locale-gen en_US.UTF-8 && sudo update-locale LANG=en_US.UTF-8

ENV LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 TERM=xterm

ADD . /opt/yarn-image/

RUN /opt/yarn-image/install.sh

ENTRYPOINT ["/opt/yarn-image/entry.sh"]
