#FROM resin/rpi-raspbian:wheezy
FROM library/ubuntu:14.04
MAINTAINER Martijn Endenburg <martijn.endenburg@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN groupadd -r user && \
    useradd -r -g user user

USER user

# Copy binaries
COPY bin/controller-server /controller-server

# Copy config
COPY server.conf.json /server.conf.json

EXPOSE 1181

# Entrypoint
CMD ["/controller-server", "-c=server.conf.json"]
