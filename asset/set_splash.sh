
splash_location='/usr/share/plymouth/themes/pix/'
git_url='https://github.com/binesheb/vertigo/'
cd $splash_location
sudo rm -r ./vertigo/
git clone $git_url -l
mv ./vertigo/asset/vertigo_alpha.png ./splash.png
mv ./vertigo/asset/vertigo_beta.png ./wall.png
sudo mv ./wall.png /home/pi/Pictures/
cd /home/pi/Picures/
pcmanfm --set-wallpaper ./wall.png
#sudo rm -r ./vertigo/


#if test -f ./splash_vertigo.png; then
#	echo "File exist"
#	sudo mv ./splash_vertigo.png ./splash.png
#else if test -f ./splash_raspi.png; then
#	curl -# $img_url -o ./splash_vertigo.png
#	mv ./splash_vertigo.png ./splash.png 
#	echo "File already replaced"
#fi
#mv ./splash.png ./splash_raspi.png
#fi

#exit code
exit 0
