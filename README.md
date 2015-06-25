Dockerized rpi-controller for RaspberryPi
=========================================

Build an image for running [rpi-controller](https://github.com/martyn82/rpi-controller) on a RaspberryPi.
It uses the [resin raspbian](https://registry.hub.docker.com/u/resin/rpi-raspbian) base image.

This image copies the rpi-controller binary into the image.

Note that you need to compile it for ARM architecture, which requires a compilation of the GO compiler for ARM as
well. It is done automatically using the build-container.

All you need is checkout the repository on RaspberryPi and run ```./container build```. When it is finished successfully
you can run ```./container start``` to start the controller.

Configuration can be adjusted by altering the ```controllerd.conf.json``` file located in the ```dist``` folder.
