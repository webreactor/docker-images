FROM ubuntu:20.04

ADD . /opt/base-image/

RUN apt-get update && apt-get install -y locales
RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8

ENV LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 TERM=xterm

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Minsk

RUN /opt/base-image/install.sh
RUN /opt/base-image/build-nxlog.sh
