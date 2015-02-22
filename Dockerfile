FROM resin/rpi-raspbian:wheezy
MAINTAINER Martijn Endenburg <martijn.endenburg@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Copy binaries
COPY controller-server /controller-server

# Copy config
COPY conf.json /etc/rpi-controller/conf.json

# Entrypoint
CMD ["/controller-server"]
