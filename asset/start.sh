#!/bin/bash
#Welcome Script
echo "Welcome to Initial Setup Script by WiFied Networks"
sleep 3

echo "Setting up cron job"
(crontab -l ; echo "@reboot sudo bash /boot/start.sh") | sort - | uniq - | crontab -
 
#step 1 :copy base files to /home
echo "Copying base file from boot device"
sudo mv /boot/set_config.sh /home/
cd /home/
sudo bash ./set_config.sh

#
sudo mv /boot/boot_1.sh /home/pi
sudo mv /boot/keyboard /etc/default/
cd /home/pi
sleep 5
echo "Executing First Script..."
sudo bash ./boot_1.sh
sudo mv /boot/set_eth.sh /home/
cd /home/
sudo bash ./set_eth.sh
sudo mv /boot/boot_2.sh /home/
cd /home/
sudo bash ./boot_2.sh
sudo rm /boot/start.sh
exit
