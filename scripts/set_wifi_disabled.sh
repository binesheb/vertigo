#!/bin/bash
echo "Disabling WiFi Feature"
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
ls
sudo cp set_wifi*.sh /home/pi/Desktop/ -r
sudo cp wpa*.conf /boot/vertigo/ -r
sudo rm /etc/wpa_supplicant/wpa_supplicant.conf

sleep 1
sudo ls /home/pi/Desktop/
echo "WIFI Service disabled (requires reboot)"
sleep 1
echo "Rebooting in 5seconds to make changes is effect"
sleep 1
sudo reboot
exit
