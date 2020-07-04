# 18.04 
FROM ubuntu:bionic

WORKDIR /root

COPY . /tmp/dotFile
ARG PROXY_ADDR
RUN cd /tmp/dotFile && bash init.sh

CMD /bin/bash