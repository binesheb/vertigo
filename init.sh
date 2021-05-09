#! /bin/bash
echo "Welcome to Vertigo Racing team"
sleep 5
echo "Enter username"
read username
echo "Enter password"
read password
if [[ ( $username == "binesheb" && $password == "binesheb@16" ) ]]; then
echo "valid user"
echo "Welcome $name to Vertigo Racing"
Year=`date +%Y`
Month=`date +%m`
Day=`date +%d`
Hour=`date +%H`
Minute=`date +%M`
Second=`date +%S`
echo `date`
echo "Current Date is: $Day-$Month-$Year"
echo "Current Time is: $Hour:$Minute:$Second"
sleep 3
echo Updating all base files
sleep 1
sudo apt update
sudo apt -y dist-upgrade
sudo apt -y autoremove
sudo apt clean
sudo apt purge -y $(dpkg -l | awk '/^rc/ { print $2 }')
else
echo "invalid user"
fi
