#!/bin/bash
sudo rm -r vertigo
sudo git clone https://www.github.com/binesheb/vertigo.git
sudo rm -r /boot/vertigo
sudo mv ./vertigo /boot/
exit
