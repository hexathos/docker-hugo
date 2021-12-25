FROM debian:bullseye

MAINTAINER Rainer Bendig <hexathos@mailbox.org>

RUN apt update
RUN apt full-upgrade
run apt install -y \
    curl \
    git \
    openssh-client \
    rsync

ENV VERSION 0.91.2
RUN mkdir -p /usr/local/src \
    && cd /usr/local/src \

RUN  curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_linux-64bit.tar.gz | tar -xz \
    && mv hugo /usr/local/bin/hugo \

RUN  addgroup -Sg 1000 hugo \
RUN  adduser -SG hugo -u 1000 -h /src hugo

WORKDIR /src

EXPOSE 1313