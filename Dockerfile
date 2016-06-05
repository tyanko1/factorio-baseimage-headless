FROM phusion/baseimage:latest

#This docker contains all the necessary components to spin up a Factorio instance

RUN apt-get update \
  && apt-get install -y curl \
  && apt-get install -y screen \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN mkdir /opt/factorio \
    && cd /opt/factorio \
    && curl -L -k https://www.factorio.com/get-download/0.12.33/headless/linux64 | tar --strip-components=1 -xzf -

ADD factorio-init /opt/factorio-init 
ADD config /opt/factorio-init/config
#ADD factorio-init-save.zip /opt/factorio/saves/factorio-init-save.zip
ADD world2-save.zip /opt/factorio/saves/world2-save.zip
ADD config.ini.normal /opt/factorio/config/config.ini 

RUN useradd -U -s /bin/bash factorio \
    && gpasswd -a factorio sudo \
    && chown -R factorio:factorio /opt/factorio \
    && chown -R factorio:factorio /opt/factorio-init

RUN mkdir /etc/service/factorio \
    && ln -s /opt/factorio-init/factorio /etc/service/factorio/run \
    && chmod +x /opt/factorio-init/factorio \
    && ln -s /opt/factorio-init/factorio.service /etc/service/factorio/ \
    && ln -s /opt/factorio-init/config /etc/default/factorio \
    && ln -s /opt/factorio-init/factorio /usr/local/bin

USER factorio
WORKDIR /opt/factorio-init

VOLUME ["/factorio/saves"]
VOLUME ["/factorio/mods"]

EXPOSE 34197/udp

CMD /opt/factorio/bin/x64/factorio --start-server world2-save
