FROM phusion/baseimage:latest

#This docker contains all the necessary components to spin up a Factorio instance

RUN apt-get update \
  && apt-get install -y wget \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd /opt/ \
    && wget https://www.factorio.com/get-download/0.13.16/headless/linux64 -O factorio_0.13.16 \
    && tar -xzf factorio_0.13.16  \
    && rm factorio_0.13.16

WORKDIR /opt/factorio

VOLUME ["/opt/factorio/saves"]
VOLUME ["/opt/factorio/config"]

EXPOSE 34197/udp

ADD run /etc/service/factorio/

CMD ["/sbin/my_init"]
