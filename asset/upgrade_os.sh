#!/bin/bash
echo "Updating and Upgrading OS"
sleep 1
echo "Updating the OS..."
sleep 3
sudo apt-get update -y
echo "Upgrading the OS..."
sleep 3
sudo apt-get upgrade -y
sleep 3
sudo rm /boot/upgrade_os.sh
sudo reboot


