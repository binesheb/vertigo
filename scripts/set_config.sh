#!/bin/bash
echo "Reconfigure the config.txt file"
cat /boot/config.txt
echo 'avoid_warnings=2' >> /boot/config.txt
echo 'max_usb_current=1' >> /boot/config.txt
echo 'program_usb_boot_mode=1' >> /boot/config.txt
echo 'arm_freq=1200' >> /boot/config.txt
sleep 5
echo "Self Destruct"
sudo rm ./set_config.sh
sudo rm /boot/set_config.sh
echo "Rebooting to make changes is effect"
sudo reboot
exit
