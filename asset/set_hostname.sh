#!/bin/bash
echo "Changing Hostname"
sudo hostnamectl
sudo hostnamectl set-hostname 'wified'
sudo hostnamectl
timedatectl set-timezone Asia/Kolkata
sleep 3
echo "Rebooting to make changes is effect"
sudo reboot
exit
