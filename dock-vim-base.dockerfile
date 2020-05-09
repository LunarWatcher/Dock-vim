FROM ubuntu:18.04

ENV LANG C.UTF-8

RUN set -ex \
    && sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y build-essential apt-utils \
    && apt-get install -y software-properties-common \
    && apt-get install -y byobu curl git htop man unzip vim wget bash \
    && apt-get install -y python3 python3-pip
