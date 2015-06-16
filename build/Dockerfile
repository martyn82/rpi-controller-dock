#FROM resin/rpi-raspbian:wheezy
FROM library/ubuntu:14.04
MAINTAINER Martijn Endenburg <martijn.endenburg@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Install prerequisites
RUN apt-get update
RUN apt-get install -y \
    gcc \
    make \
    unzip \
    wget

# Build and install Go
RUN mkdir ~/go \
    && cd ~/go \
    && wget https://go.googlesource.com/go/+archive/go1.4.2.tar.gz \
    && tar -xvf go1.4.2.tar.gz \
    && cd src/ \
    && ./make.bash

# Build app
RUN mkdir ~/rpi-controller \
    && wget -O ~/rpi-controller/rpi-controller.zip \
        https://github.com/martyn82/rpi-controller/archive/master.zip \
    && cd ~/rpi-controller \
    && unzip rpi-controller.zip \
    && mkdir -p src/github.com/martyn82 \
    && mv rpi-controller-master src/github.com/martyn82/rpi-controller \
    && export GOPATH=$(pwd) \
    && export GOBIN=$GOPATH/bin \
    && ~/go/bin/go install src/github.com/martyn82/rpi-controller/server/controller-server.go \
    && ~/go/bin/go install src/github.com/martyn82/rpi-controller/client/controller.go \
    && cd ~

VOLUME "/build"

CMD cp ~/rpi-controller/bin/controller-server /build/bin/controller-server && cp ~/rpi-controller/bin/controller /build/bin/controller
