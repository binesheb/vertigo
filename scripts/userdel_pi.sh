#!/bin/bash
echo "Welcome to pi-hole by WiFi-ed Networks"
echo "Boot Script Stage Two"
sleep 3
echo"Proceeding to delete default user Pi"
sleep 3
sudo userdel -r pi
sleep 10
sudo rm /boot/boot_2.sh
echo "Self Destruct"
sudo rm ./boot_2.sh
echo "Restrating the node in 10 seconds"
sleep 10
sudo reboot


