# This Dockerfile is used to build an headles vnc image based on Ubuntu

## Custom Dockerfile
FROM consol/centos-xfce-vnc:1.1.0
MAINTAINER Tobias Schneck "tobias.schneck@consol.de"
ENV REFRESHED_AT 2017-12-24

## Install a gedit
ADD ./install/ $INST_SCRIPTS/
### Install RedisDesktopManager
USER 0
RUN $INST_SCRIPTS/redis_desktop_manager.sh
## switch back to default user
USER 1984
