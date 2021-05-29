#!/bin/bash
echo "Initiating Self Heal Process"
sleep 3
clear
#check for internet connection
while ! ping -c 1 -W 1 1.1.1.1; do
echo "Internet not connected"
sleep 1
done
sudo cp /boot/vertigo/scripts/self_update.sh /boot/self_update_git.sh
cd ~
echo "Removing Old Files"
sudo rm -r vertigo
echo "Removed"
echo "Clonning from Repository"
sudo git clone https://www.github.com/binesheb/vertigo.git
echo "Cloned"
echo "Cleaning up Destination Folder"
sudo rm -r /boot/vertigo
sudo mv ./vertigo /boot/
echo "Self Heal Complete"
sleep 3
exit
