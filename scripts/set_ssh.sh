#!/bin/bash
echo "Enabling SSH Feature"
sudo mv /boot/vertigo/ssh /boot
echo "SSH Service enabled (requires reboot)"
sleep 3
echo "Self Destruct"
sudo rm /boot/vertigo/set_ssh.sh
#echo "Rebooting to make changes is effect"
#sleep 3
#sudo reboot
exit
