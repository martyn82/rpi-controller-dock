# This Dockerfile creates a containerized rpi-controller build instance.
# It will compile and package a rpi-controller application.

FROM resin/rpi-raspbian:wheezy
MAINTAINER Martijn Endenburg <martijn.endenburg@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

VOLUME /build
VOLUME /schema

# Install prerequisites
RUN apt-get update
RUN apt-get install -y \
    gcc \
    git-core \
    make \
    mercurial \
    unzip \
    wget

# Build and install Go
RUN mkdir /go \
    && cd /go \
    && wget --no-check-certificate https://go.googlesource.com/go/+archive/go1.4.2.tar.gz \
    && tar -xvf go1.4.2.tar.gz \
    && cd src/ \
    && ./make.bash

# Build app
RUN mkdir -p /rpi-controller \
    && export GOPATH=/rpi-controller \
    && export GOBIN=$GOPATH/bin \
    && wget --no-check-certificate -O /rpi-controller/rpi-controller.zip \
        https://github.com/martyn82/rpi-controller/archive/WIP/refactor.zip \
    && cd /rpi-controller \
    && unzip rpi-controller.zip \
    && mkdir -p src/github.com/martyn82 \
    && mv rpi-controller-WIP-refactor src/github.com/martyn82/rpi-controller \
    && echo "Retrieving dependency: go-uuid..." && /go/bin/go get -d code.google.com/p/go-uuid || true \
    && echo "Retrieving dependency: mattn/go-sqlite3..." && /go/bin/go get github.com/mattn/go-sqlite3 \
    && echo "Retrieving dependency: martyn82/go-testing..." && /go/bin/go get -d github.com/martyn82/go-testing || true \
    && echo "Retrieving dependency: stretchr/testify..." && /go/bin/go get github.com/stretchr/testify \
    && echo "Running tests..." && cd src/github.com/martyn82/rpi-controller && /go/bin/go test -v ./... || true && cd - \
    && echo "Compile and install server..." && /go/bin/go install src/github.com/martyn82/rpi-controller/server/controllerd.go \
    && cd ~

CMD cp /rpi-controller/bin/controllerd /build/controllerd \
    && cp /rpi-controller/src/github.com/martyn82/rpi-controller/schema/* /schema
