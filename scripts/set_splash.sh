#!/bin/bash
splash_location='/usr/share/plymouth/themes/pix/'
cd $splash_location
sleep 1
sudo mv /boot/vertigo/vertigo_beta.png ./
sleep 3
sudo mv ./vertigo_beta.png ./splash.png
sleep 3
#git_url='https://github.com/binesheb/vertigo/'
#cd $splash_location
#sudo rm -r ./vertigo/
#git clone $git_url -l
#cd /home/pi/Picures/
#pcmanfm --set-wallpaper ./wall.png
#sudo rm -r ./vertigo/
echo "Self Destruct - Set Splash"
sudo rm -r /boot/vertigo/set_splash.sh
#exit code
exit 0
