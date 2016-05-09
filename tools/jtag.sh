#!/bin/bash

QUARTUS_HOME=${QUARTUS_HOME:-/opt/altera/q2web/quartus}

sudo killall jtagd
sudo chmod 755 /sys/kernel/debug/usb/devices
sudo chmod 755 /sys/kernel/debug/usb
sudo chmod 755 /sys/kernel/debug
sudo mount --bind /dev/bus /proc/bus
sudo ln -s /sys/kernel/debug/usb/devices /proc/bus/usb/devices
sudo $QUARTUS_HOME/bin/jtagd
sudo $QUARTUS_HOME/bin/jtagconfig
