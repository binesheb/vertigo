#!/bin/bash
echo "Welcome to pi-hole by WiFi-ed Networks"
echo "Boot Script Stage one"
sleep 3
sudo apt install curl
#upgrade
sudo /boot/vertigo/upgrade_os.sh
sleep 1
echo "Remove First Stage Boot Scripts"
echo "Self Destruct"
sudo rm /boot/vertigo/boot_1.sh
echo "Restrating the node in 10 seconds"
sleep 10
sudo reboot


