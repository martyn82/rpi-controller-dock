FROM resin/rpi-raspbian:wheezy
MAINTAINER Martijn Endenburg <martijn.endenburg@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Update and install dependencies
RUN apt-get update && apt-get install -y supervisor

# Copy binaries
COPY controller-server /controller-server

# Copy config
COPY conf.json /etc/rpi-controller/conf.json
COPY supervisord.conf /etc/supervisord/conf.d/supervisord.conf

# Entrypoint
CMD ["/controller-server"]
