FROM phusion/baseimage:latest

#This docker contains all the necessary components to spin up a Factorio instance

RUN apt-get update \
  && apt-get install -y curl \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN cd /opt/ \
    && curl -O 162.243.17.143/files/factorio_headless_x64_0.12.35.tar.gz \
    && tar -xzf factorio_headless_x64_0.12.35.tar.gz \
    && rm factorio_headless_x64_0.12.35.tar.gz 
 
WORKDIR /opt/factorio

VOLUME ["/var/factorio/users"]

RUN ln -s /var/factorio/users/tdyanko1/saves /opt/factorio/saves

EXPOSE 34197/udp

CMD /opt/factorio/bin/x64/factorio --start-server fresh-save 
