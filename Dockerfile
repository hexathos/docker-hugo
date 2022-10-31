FROM debian:bullseye

LABEL maintainer="hexathos@mailbox.org"

RUN apt update
RUN apt install -y curl git rsync

ENV VERSION 0.105.0

RUN mkdir -p /usr/local/src
RUN cd /usr/local/src 
RUN curl -vL https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_linux-amd64.deb -o /usr/local/src/hugo.deb
RUN apt install /usr/local/src/hugo.deb
RUN apt-get clean
RUN rm -Rf /usr/local/src
RUN addgroup --gid 1000 hugo 
RUN adduser --system --home /src --gid 1000 --uid 1000 hugo 
RUN hugo version
WORKDIR /src

EXPOSE 1313
