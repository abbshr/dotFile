# 18.04 
FROM ubuntu:bionic

WORKDIR /root

ARG PROXY_ADDR
ARG DOTFILE_LOG_LEVEL=ALL

COPY . /tmp/dotFile
RUN cd /tmp/dotFile && bash init.sh

CMD /bin/bash