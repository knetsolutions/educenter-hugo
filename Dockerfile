FROM ubuntu:xenial


ENV VERSION 0.76.5

RUN apt-get update  && apt-get install -y --force-yes  iproute2 tcpdump curl git gcc g++ build-essential


RUN mkdir -p /usr/local/src \
    && cd /usr/local/src \
    && curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_extended_${VERSION}_Linux-64bit.tar.gz | tar -xz \
    && mv hugo /usr/local/bin/hugo 

WORKDIR /www


hugo new site knetsolutions && cd knetsolutions
git clone https://github.com/knetsolutions/educenter-hugo.git
cd educenter-hugo/exampleSite

EXPOSE 80
hugo server -D  --baseURL "http://knetsolutions.in/" --bind `hostname -I` -p 80 --themesDir ../..
