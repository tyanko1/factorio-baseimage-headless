FROM phusion/baseimage:latest

#This docker contains all the necessary components to spin up a Factorio instance

RUN apt-get update \
  && apt-get install -y curl \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN mkdir /opt/factorio \
    && cd /opt/factorio \
    && curl -O 162.243.17.143/files/factorio_headless_x64_0.12.35.tar.gz \
    && tar -xvzf factorio_headless_x64_0.12.35.tar.gz \
    && rm factorio_headless_x64_0.12.35.tar.gz

RUN mkdir /etc/service/factorio 

WORKDIR /opt/factorio

VOLUME ["/var/factorio/users"]

EXPOSE 34197/udp

#CMD /opt/factorio/bin/x64/factorio --start-server world2-save
