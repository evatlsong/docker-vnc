#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install RedisDesktopManager"
mkdir -p /soft/RedisDesktopManager
wget -qO- https://codeload.github.com/uglide/RedisDesktopManager/tar.gz/0.8.8 | tar xz --strip 1 -C /soft/RedisDesktopManager
cd /soft/RedisDesktopManager/src/
./configure
source /opt/qt59/bin/qt59-env.sh && qmake && make && make install
cd /usr/share/redis-desktop-manager/bin
mv qt.conf qt.backup

