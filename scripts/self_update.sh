#!/bin/bash
echo "Initiating Self Heal Process"
sleep 3
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
