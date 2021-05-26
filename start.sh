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
#(crontab -l ; echo "@reboot sudo bash /boot/vertigo/start.sh") | sort - | uniq - | crontab -
(crontab -l ; echo "@reboot sudo bash /home/pi/Desktop/start.sh") | sort - | uniq - | crontab -
#(crontab -l ; echo "@reboot sudo bash /boot/vertigo/scripts/self_update.sh") | sort - | uniq - | crontab -
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
tree
sleep 3

echo "Copy all the base files to /boot/vertigo"
sudo tree /boot/vertigo/
sleep 2
sudo cp ./ /boot/vertigo/ -r
echo "Confirm files are copied"
sudo tree /boot/vertigo/
sleep 3
echo "Creating Semi Automatic script in Desktop"
sleep 3
sudo cp ./start.sh /home/pi/Desktop/ -r
sudo ls ~/Desktop/
clear
echo "Executing Batch scripts"

#enable ssh via set_ssh.sh
if test -f /boot/vertigo/scripts/set_ssh.sh
then
	echo "Enabling SSH module"
	sudo bash /boot/vertigo/scripts/set_ssh.sh
else
	echo "SSH Enabled"
	sleep 1
fi

#enable wifi via set_wifi.sh
if test -f /boot/vertigo/scripts/set_wifi.sh
then
	echo "Enable Wi-Fi module"
	sudo bash /boot/vertigo/scripts/set_wifi.sh
else
	echo "WIFI Enabled"
	sleep 3
fi

sudo bash /boot/vertigo/scripts/upgrade_os.sh
echo "Upgrade script disabled"
sleep 4
echo "Setting Splash Screen"
sudo bash /boot/vertigo/scripts/set_splash.sh
sleep 4
echo "Setting up Hotspot Service"
sudo bash /boot/vertigo/scripts/install_hotspot.sh

-rwxr-xr-x 1 root root  323 May 22 08:02 boot_1.sh
-rwxr-xr-x 1 root root  303 May 22 08:02 boot_2.sh
-rwxr-xr-x 1 root root 2467 May 23 11:35 install_hotspot.sh
drwxr-xr-x 2 root root  512 May 23 20:59 python_scripts
-rwxr-xr-x 1 root root 1333 May 23 11:35 self_update.sh
-rwxr-xr-x 1 root root  592 May 23 12:40 set_config.sh
-rwxr-xr-x 1 root root  402 May 23 21:48 set_display_clone.sh
-rwxr-xr-x 1 root root  333 May 23 12:40 set_eth.sh
-rwxr-xr-x 1 root root  217 May 23 12:40 set_hostname.sh
-rwxr-xr-x 1 root root  552 May 23 12:40 set_lcd_touch.sh
-rwxr-xr-x 1 root root   60 May 23 12:40 set_python.sh
-rwxr-xr-x 1 root root  408 May 23 12:40 set_samba.sh
-rwxr-xr-x 1 root root  475 May 22 08:02 set_splash.sh
-rwxr-xr-x 1 root root 1179 May 23 12:40 set_wifi_disabled.sh
-rwxr-xr-x 1 root root  379 May 23 12:40 set_wpa.sh
-rwxr-xr-x 1 root root  123 May 23 12:40 set_X11_HDMI.sh
-rwxr-xr-x 1 root root  131 May 23 12:40 set_X11_LCD.sh
-rwxr-xr-x 1 root root  412 May 23 21:46 upgrade_os.sh
-rwxr-xr-x 1 root root  199 May 22 08:02 useradd_wified.sh
-rwxr-xr-x 1 root root  303 May 22 08:02 userdel_pi.sh

#self destruct after all complete
echo -e "\e[1;31mSelf Destruct \e[0m"
sleep 3
#sudo rm -r /boot/vertigo/
echo -e "Complete"
echo "Clean Desktop"
sleep 3
sudo rm /home/pi/Desktop/start.sh -r
echo "Desktop Cleaned"
sleep 2
echo "Final Reboot"
sleep 5
#sudo reboot
exit
