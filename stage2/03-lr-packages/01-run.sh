#!/bin/bash -e

git clone "https://github.com/runmyrobot/runmyrobot" "${ROOTFS_DIR}/home/robocaster/runmyrobot"
chown -Rv 1000:1000 "${ROOTFS_DIR}/home/robocaster/runmyrobot"

install -v -o 1000 -g 1000 -m 644 files/.bash_aliases "${ROOTFS_DIR}/home/robocaster"
install -v -m 755 files/ctemp	"${ROOTFS_DIR}/usr/local/bin"
install -v -m 755 files/devices	"${ROOTFS_DIR}/usr/local/bin"
install -v -m 755 files/00-lr-motd	"${ROOTFS_DIR}/etc/update-motd.d"

echo "i2c-dev" >> ${ROOTFS_DIR}/etc/modules

on_chroot << EOF
apt update
update-command-not-found
pip install requests
pip install socketIO-client
pip3 install requests
pip3 install socketIO-client
EOF
