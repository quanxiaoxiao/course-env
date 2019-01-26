FROM ubuntu:18.04

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y --no-install-recommends \
  apt-utils \
  locales \
  ca-certificates \
  curl \
  && apt-get purge --auto-remove \
  && rm -rf /tmp/* /var/lib/apt/lists/*

RUN apt-get update && apt-get -y install --no-install-recommends \
  fonts-wqy-zenhei \
  fonts-wqy-microhei \
  fonts-droid-fallback \
  fonts-noto-cjk \
  && rm -rf /tmp/* /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y libreoffice \
  && rm -rf /tmp/* /var/lib/apt/lists/*

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y python-dev \
  build-essential \
  && rm -rf /tmp/* /var/lib/apt/lists/*

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y dirmngr \
  && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1655A0AB68576280 \
  && rm -rf /tmp/* /var/lib/apt/lists/*

COPY nodesource.list /etc/apt/sources.list.d/nodesource.list

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --no-install-recommends nodejs \
  && apt-get purge --auto-remove \
  && rm -rf /tmp/* /var/lib/apt/lists/*
