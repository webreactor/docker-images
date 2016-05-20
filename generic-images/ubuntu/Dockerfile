FROM ubuntu:14.04

ENV LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 TERM=xterm
RUN locale-gen $LC_ALL

RUN apt-get update

RUN apt-get install -y \
    git \
    curl \
    wget \
    vim \
    ca-certificates \
    supervisor \
    software-properties-common \
    make
