#!/bin/bash
echo "Enable X11 on LCD"
sudo sed -i 's/fb0/fb1/g' /usr/share/X11/xorg.conf.d/99-fbturbo.conf
sudo reboot
sleep 3
exit
