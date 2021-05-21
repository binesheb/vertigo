#!/bin/bash
echo -e "\e[1:31mUpdating and Upgrading OS\e[0m"
sleep 1
echo "Updating the OS..."
sleep 2
sudo apt-get update -y
echo "Upgrading the OS..."
sleep 2
sudo apt-get upgrade -y
sleep 3
echo "Self Destruct"
sudo rm /boot/vertigo/upgrade_os.sh
echo "Rebooting device after upgradation"
sleep 1
echo "Rebooting in 5seconds"
sleep 5
#sudo reboot


