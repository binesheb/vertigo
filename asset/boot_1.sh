#!/bin/bash
echo "Welcome to pi-hole by WiFi-ed Networks"
echo "Boot Script Stage one"
sleep 3
#upgrade
sudo /boot/upgrade_os.sh
sleep 1
echo "Adding user wified"
useradd wified; echo -e "wified123\nwified123" | sudo passwd wified
sudo usermod -aG sudo wified
sudo apt install curl
curl -sSL https://install.pi-hole.net | bash
echo -e "\n" | pihole -a -p
echo "Upgrading DNS Server to latest verison"
sleep 2
pihole -up
echo "Remove First Stage Boot Scripts"
sudo rm /boot/boot_1.sh
echo "Self Destruct"
sudo rm ./boot_1.sh
echo "Restrating the node in 10 seconds"
sleep 10
sudo reboot


