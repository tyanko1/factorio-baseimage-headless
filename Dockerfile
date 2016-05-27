FROM phusion/baseimage:latest

#This docker contains all the necessary components to spin up a Factorio instance

RUN apt-get update \
  && apt-get install -y curl \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt/factorio
RUN curl -L -k https://www.factorio.com/get-download/0.12.33/headless/linux64 | tar --strip-components=1 -xzf -

ADD factorio-init /etc 
ADD config /etc/factorio-init

VOLUME ["/factorio/saves"]
VOLUME ["/factorio/mods"]

EXPOSE 34197/udp
