FROM phusion/baseimage:latest

#This docker contains all the necessary components to spin up a Factorio instance

RUN apt-get update \
  && apt-get install -y curl \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD factorio-init /opt/factorio
   
RUN  mv /opt/factorio/config.example /opt/factorio/config

WORKDIR /factorio
