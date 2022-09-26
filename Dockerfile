FROM debian:bullseye

LABEL maintainer="hexathos@mailbox.org"

RUN apt update
RUN apt install -y \
    curl \
    git \
    openssh-client \
    rsync

ENV VERSION 0.104.0
RUN mkdir -p /usr/local/src
RUN cd /usr/local/src 
RUN curl -vL https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_linux-amd64.deb -o /usr/local/src/hugo_${VERSION}_linux-amd64.deb
RUN apt install /usr/local/src/hugo_${VERSION}_linux-amd64.deb
RUN rm /usr/local/src/hugo_${VERSION}_linux-amd64.deb
RUN addgroup --gid 1000 hugo 
RUN adduser --system --home /src --gid 1000 --uid 1000 hugo 
RUN hugo version
WORKDIR /src

EXPOSE 1313
