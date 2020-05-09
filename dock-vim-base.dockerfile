FROM ubuntu:18.04

ENV LANG C.UTF-8

RUN set -ex \
    && sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y build-essential apt-utils \
    && apt-get install -y software-properties-common \
    && apt-get install -y byobu curl git htop man unzip wget bash \
    && apt-get install -y python3 python3-pip \
    && apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
        libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
        libcairo2-dev libx11-dev libxpm-dev libxt-dev \
        python3-dev
COPY . /helpers
RUN mkdir build && cd build \
        && git clone https://github.com/vim/vim.git \
