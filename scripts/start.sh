#!/bin/bash
#Welcome Script
clear
#sleep 1
echo "Welcome to Initial Setup Script by WiFi-ed Networks"
#sleep 2
clear
echo -e "\e[1;36m
____   ____             __  .__                
\   \ /   /____________/  |_|__| ____   ____   
 \   Y   // __ \_  __ \   __\  |/ ___\ /  _ \  
  \     /\  ___/|  | \/|  | |  / /_/  >  <_> ) 
   \___/  \___  >__|   |__| |__\___  / \____/  
              \/              /_____/          
__________               .__                
\______   \_____    ____ |__| ____    ____  
 |       _/\__  \ _/ ___\|  |/    \  / ___\ 
 |    |   \ / __ \\  \___|  |   |  \/ /_/  >
 |____|_  /(____  /\___  >__|___|  /\___  / 
        \/      \/     \/        \//_____/  
\e[1;32m
In Association with District 08 Customs (@D08C)
\e[0m"
#sleep 2
echo -e "Designed and Developed by \e[1;32m WiFi-ed Networks, Kochi \e[1;31m (@wifiedkochi) \e[0m"
sleep 5
echo -e "Setting up cron job for \e[1;32msemi - automated installation\e[0m"
(crontab -l ; echo "@reboot sudo bash /boot/vertigo/start.sh") | sort - | uniq - | crontab -
(crontab -l ; echo "@reboot sudo vncserver") | sort - | uniq - | crontab -
(crontab -l ; echo "@reboot sudo bash /boot/vertigo/self_update.sh") | sort - | uniq - | crontab -
sleep 1
echo -e "cron job created \e[1;32m Successfully \e[0m"

#save copy of the base files to boot device
echo "Copying base file from boot device"
#sudo rm -r /boot/vertigo
#sudo ls /boot
sudo mkdir /boot/vertigo
#sudo ls /boot
#sleep 2

clear
#identify the script file location
echo "Identifying the source folder"
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  TARGET="$(readlink "$SOURCE")"
  if [[ $TARGET == /* ]]; then
    echo "SOURCE '$SOURCE' is an absolute symlink to '$TARGET'"
    SOURCE="$TARGET"
  else
    DIR="$( dirname "$SOURCE" )"
    echo "SOURCE '$SOURCE' is a relative symlink to '$TARGET' (relative to '$DIR')"
    SOURCE="$DIR/$TARGET" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
  fi
done
echo "SOURCE is '$SOURCE'"
RDIR="$( dirname "$SOURCE" )"
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
if [ "$DIR" != "$RDIR" ]; then
  echo "DIR '$RDIR' resolves to '$DIR'"
fi
echo "DIR is '$DIR'"
sleep 1
echo "Switching to Source Folder"
cd $DIR
sleep 1
echo "Checking Source Folder"
pwd
echo "Listing files in Folder to confirm"
sleep 1
ls
sleep 3

echo "Copy all the base files to /boot/vertigo"
sudo ls /boot/vertigo/
sleep 2
sudo cp ./ /boot/vertigo/ -r
echo "Confirm files are copied"
sudo ls /boot/vertigo/
sleep 3
sudo cp ./start.sh /home/pi/Desktop/ -r
sudo ls ~/Desktop/
clear
echo "Executing Batch scripts"

#enable ssh via set_ssh.sh
if test -f /boot/vertigo/set_ssh.sh
then
	echo "Enabling SSH module"
	sudo bash /boot/vertigo/set_ssh.sh
else
	echo "SSH Enabled"
	sleep 1
fi

#enable wifi via set_wifi.sh
if test -f /boot/vertigo/set_wifi.sh
then
	echo "Enable Wi-Fi module"
	sudo bash /boot/vertigo/set_wifi.sh
else
	echo "WIFI Enabled"
	sleep 3
fi

#sudo bash /boot/vertigo/upgrade_os.sh
echo "Upgrade script disabled"
sleep 4
echo "Setting Splash Screen"
sudo bash /boot/vertigo/set_splash.sh
sleep 4
echo "Setting up Hotspot Service"
sudo bash /boot/vertigo/install_hotspot.sh

#self destruct after all complete
echo -e "\e[1;31mSelf Destruct \e[0m"
sleep 3
#sudo rm -r /boot/vertigo/
echo -e "Complete"
sleep 3
sudo rm /home/pi/Desktop/start.sh -r
echo "Desktop Cleaned"
sleep 2
echo "Final Reboot"
sleep 5
#sudo reboot
exit
