FROM ubuntu:18.04

ENV LANG C.UTF-8

RUN set -ex \
    && sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get -y upgrade \
    && apt install -y build-essential curl git python3 python3-pip python3-dev cmake \
        ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
COPY . /helpers
RUN mkdir build && cd build \
        && git clone https://github.com/neovim/neovim.git
