#!/bin/bash
echo "Enabling WiFi Feature"
sudo mv /boot/vertigo/wpa_supplicant.conf /boot
sudo cp /boot/wpa_supplicant.conf /etc/wpa_supplicant/ -r
echo "WIFI Service enabled (requires reboot)"
sleep 2
echo "Self Destruct"
sudo rm /boot/vertigo/set_wifi.sh
echo "Rebooting in 5seconds to make changes is effect"
sleep 5
sudo reboot
exit
