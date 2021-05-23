#!/bin/bash
echo "Reconfigure the config.txt file"
sudo grep -qxF 'avoid_warnings=2' /boot/config.txt || echo 'avoid_warnings=2' >> /boot/config.txt
sudo grep -qxF 'max_usb_current=1' /boot/config.txt || echo 'max_usb_current=1' >> boot/config.txt
sudo grep -qxF 'program_usb_boot_mode=1' /boot/config.txt || echo 'program_usb_boot_mode=1' >> /boot/config.txt
sudo grep -qxF 'arm_freq=1200' /boot/config.txt || echo 'arm_freq=1200' >> boot/config.txt
sudo grep -qxF 'disable_splash=1' /boot/config.txt || echo 'disable_splash=1' >> boot/config.txt
sudo grep -qxF 'gpu_mem=128' /boot/config.txt || echo 'gpu_mem=128' >> boot/config.txt
sleep 5
echo "Self Destruct"
#sudo rm ./set_config.sh
#sudo rm /boot/set_config.sh
echo "Rebooting to make changes is effect"
#sudo reboot
exit
