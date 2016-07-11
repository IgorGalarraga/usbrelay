#!/bin/sh

sudo cp ./99-dct-tech-usb-relay-2.rules /etc/udev/rules.d/99-dct-tech-usb-relay-2.rules
sudo udevadm control --reload-rules
echo "Before use usbrelay, plug USB relay module (unplug if previously plugged)"
