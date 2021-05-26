#!/bin/bash
echo "Enabling WiFi Feature"
sudo bash /boot/vertigo/scripts/create_wpa.sh
sudo cp /etc/wpa_supplicant/wpa_supplicant.conf /boot
echo "WIFI Service enabled (requires reboot)"
sleep 2
echo "Self Destruct"
#sudo rm /boot/vertigo/scripts/set_wifi.sh
echo "Rebooting in 5seconds to make changes is effect"
sleep 5
exit
