FROM phusion/baseimage:latest

#This docker contains all the necessary components to spin up a Factorio instance

ENV HEADLESS_VERSION=0.13.17
ENV PLAYERNAME=player
ENV RELEASE=experimental

RUN apt-get update \
  && apt-get install -y wget \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd /opt/ \
    && wget http://162.243.17.143/files/headless/${RELEASE}/factorio_headless_x64_${HEADLESS_VERSION}.tar.gz -O factorio_${HEADLESS_VERSION} \
    && tar -xzf factorio_${HEADLESS_VERSION} \
    && rm factorio_${HEADLESS_VERSION}

WORKDIR /opt/factorio

VOLUME ["/opt/factorio/saves"]
VOLUME ["/opt/factorio/config"]

COPY factorio-init /opt/factorio/bin/
COPY run /etc/service/factorio/

CMD ["/sbin/my_init"]
