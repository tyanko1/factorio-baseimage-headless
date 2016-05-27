FROM phusion/baseimage:latest

#This docker contains all the necessary components to spin up a Factorio instance

RUN apt-get update \
  && apt-get install -y curl \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /opt/factorio \
    && cd /opt/factorio \
    && curl -L -k https://www.factorio.com/get-download/0.12.33/headless/linux64 | tar --strip-components=1 -xzf -

ADD factorio-init /opt/factorio-init 
ADD config /opt/factorio-init/config
ADD save.zip /opt/factorio/saves/factorio-init-save.zip

#RUN useradd -U -s /bin/bash factorio \
#    && gpasswd -a factorio sudo \
#    && chown -R factorio:factorio /opt/factorio \
#    && chown -R factorio:factorio /opt/factorio-init

#USER factorio
WORKDIR /opt/factorio

VOLUME ["/factorio/saves"]
VOLUME ["/factorio/mods"]

EXPOSE 34197/udp
