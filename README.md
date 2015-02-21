Dockerized rpi-controller for RaspberryPi
=========================================

Build an image for running [rpi-controller](https://github.com/martyn82/rpi-controller) on a RaspberryPi.
It uses the [resin raspbian](https://registry.hub.docker.com/u/resin/rpi-raspbian) base image.

Dependencies
-------------

This image copies a file ```controller-server``` into the image. This you need to build and compile yourself from the
[rpi-controller](https://github.com/martyn82/rpi-controller) package.

Note that you need to compile it for ARM architecture, which requires a compilation of the GO compiler for ARM as
well.
