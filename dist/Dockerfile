# This Dockerfile creates a containerized rpi-controller production instance.
# It will install and run a rpi-controller application.

FROM resin/rpi-raspbian:wheezy
MAINTAINER Martijn Endenburg <martijn.endenburg@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y sqlite3

# Copy binaries
COPY bin/controllerd /controllerd

# Copy config
COPY controllerd.conf.json /controllerd.conf.json

# Prepare DB
RUN mkdir -p /schema
RUN mkdir -p /data

COPY schema/* /schema/
COPY import_schema.sh /import_schema.sh
COPY setup_db.sh /setup_db.sh
RUN /setup_db.sh

EXPOSE 1181

# Entrypoint
CMD ["/controllerd", "-c=/controllerd.conf.json"]
