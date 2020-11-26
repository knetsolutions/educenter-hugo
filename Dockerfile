FROM ubuntu:xenial


ENV VERSION 0.76.5

RUN apt-get update  && apt-get install -y --force-yes  iproute2 tcpdump curl git gcc g++ build-essential


RUN mkdir -p /usr/local/src \
    && cd /usr/local/src \
    && curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_extended_${VERSION}_Linux-64bit.tar.gz | tar -xz \
    && mv hugo /usr/local/bin/hugo 

WORKDIR /www
EXPOSE 80
RUN hugo new site knetsolutions 
RUN cd knetsolutions && git clone https://github.com/knetsolutions/educenter-hugo.git 
WORKDIR /www/knetsolutions/educenter-hugo/exampleSite 
CMD hugo server -D  --baseURL "http://dev.knetsolutions.in/" --bind `hostname -I` -p 80 --themesDir ../..
