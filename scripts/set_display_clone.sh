#!/bin/bash
sudo git clone https://github.com/AndrewFromMelbourne/raspi2fb.git
cd raspi2fb
mkdir build
cd build
cmake ..
make
sudo make install
sudo cp ../raspi2fb@.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable raspi2fb@1.service
sudo systemctl start raspi2fb@1sudo reboot
sleep 3
echo "Reboot if required"

sleep 3
exit
