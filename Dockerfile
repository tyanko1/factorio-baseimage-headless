FROM phusion/baseimage:0.9.20


#This docker contains all the necessary components to spin up a Factorio instance

ENV HEADLESS_VERSION=0.14.22
ENV PLAYERNAME=player
ENV RELEASE=stable

RUN apt-get update \
  && apt-get install -y wget \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd /opt/ \
    && wget http://factoriohub.io/files/headless/${RELEASE}/factorio_headless_x64_${HEADLESS_VERSION}.tar.gz -O factorio_${HEADLESS_VERSION} \
    && tar -xzf factorio_${HEADLESS_VERSION} \
    && rm factorio_${HEADLESS_VERSION}

WORKDIR /opt/factorio
COPY config /opt/factorio/config/
COPY factorio-init /opt/factorio/bin/
COPY run /etc/service/factorio/run

CMD ["/sbin/my_init"]
