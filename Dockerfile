# This Dockerfile is used to build an headles vnc image based on Ubuntu

## Custom Dockerfile
FROM consol/ubuntu-xfce-vnc:1.2.3
MAINTAINER Tobias Schneck "tobias.schneck@consol.de"
ENV REFRESHED_AT 2017-12-24

## Install a gedit
ADD ./install/ $INST_SCRIPTS/
### Install RedisDesktopManager
USER 0

RUN apt-get update && apt-get install -y git lsb-release sudo software-properties-common \
&& mkdir -p /soft/RedisDesktopManager \
&& wget -qO- https://codeload.github.com/uglide/RedisDesktopManager/tar.gz/0.8.8 | tar xz --strip 1 -C /soft/RedisDesktopManager \
&& cd /soft/RedisDesktopManager/src/ \
&& ./configure \
&& source /opt/qt59/bin/qt59-env.sh && qmake && make && make install \
&& cd /usr/share/redis-desktop-manager/bin \
&& mv qt.conf qt.backup

## RUN ls /headless/install/
## RUN chmod 777 /headless/install/redis_desktop_manager.sh
## RUN /headless/install/redis_desktop_manager.sh
## switch back to default user
USER 1984
