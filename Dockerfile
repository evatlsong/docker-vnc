# This Dockerfile is used to build an headles vnc image based on Ubuntu

## Custom Dockerfile
FROM consol/ubuntu-xfce-vnc:1.1.0
MAINTAINER Tobias Schneck "tobias.schneck@consol.de"
ENV REFRESHED_AT 2017-12-24

### Install RedisDesktopManager
USER 0
RUN apt-get update && apt-get install -y git lsb-release sudo software-properties-common

RUN git clone --recursive https://github.com/uglide/RedisDesktopManager.git -b 0.8.0 rdm \
    && cd ./rdm/src \
    && ./configure \
    && . /opt/qt56/bin/qt56-env.sh \
    && qmake \
    && make \
    && make install \
    && cd /usr/share/redis-desktop-manager/bin/ \
    && rm qt.conf

ENV QT_QPA_PLATFORM_PLUGIN_PATH /opt/qt56/plugins/platforms/
ENV LD_LIBRARY_PATH=/opt/qt56/lib/

## switch back to default user
USER 1984
