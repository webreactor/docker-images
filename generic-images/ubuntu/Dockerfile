FROM ubuntu:14.04

RUN sudo locale-gen en_US.UTF-8 && sudo update-locale LANG=en_US.UTF-8

ENV LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 TERM=xterm

ADD . /opt/base-image/

RUN /opt/base-image/install.sh
