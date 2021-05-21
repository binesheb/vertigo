#!/bin/bash
echo "Enable LCD Display 3.5inch touch"
sleep 1
sudo grep -qxF 'dtoverlay=piscreen2r' /boot/config.txt || echo 'dtoverlay=piscreen2r' >> /boot/config.txt
sudo grep -qxF 'arm_freq=1200' /boot/config.txt || echo 'arm_freq=1200' >> boot/config.txt
#sudo reboot
sudo apt-get install fbi -y --fix-missing
sudo apt-get install mplayer -y
wget https://ozzmaker.com/piscreen/image-test.gif
sudo fbi -noverbose -T 1 -a -d /dev/fb1 image-test.gif
sleep 3
sudo fbi -noverbose -T 1 -a -d /dev/fb1 /usr/share/plymouth/themes/pix/splash.png
sleep 3
exit
