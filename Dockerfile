FROM debian:latest
USER root
WORKDIR /app

COPY . /app

RUN apt-get update
RUN apt-get install -y wget curl git aria2 gpg

# install nodejs 
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash
RUN apt-get install -y nodejs

RUN git clone --depth 1 https://github.com/ziahamza/webui-aria2

#      web rpc  dht
EXPOSE 80  6800 6881

VOLUME ["/data"]

WORKDIR /app/webui-aria2
CMD aria2c --conf-path=/app/aria2.conf && node node-server.js 80 1>/dev/null

# vim: nu:
