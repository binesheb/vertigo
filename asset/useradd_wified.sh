#!/bin/bash
echo "Adding user wified"
useradd wified; echo -e "wified123\nwified123" | sudo passwd wified
sudo usermod -aG sudo wified
echo "Restrating the node in 10 seconds"
sleep 10
sudo reboot


