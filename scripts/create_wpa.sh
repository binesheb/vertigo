#!/bin/bash
echo "Creating WiFi Configuration File wpa_supplicant"
sleep 1
sudo cat > /etc/wpa_supplicant/wpa_supplicant.conf << EOL
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=IN

network={
	ssid="Sreyas WiFi-ed"
	psk="binesheb@16"
}
network={
        ssid="BNSH"
        psk="binesheb@16"
}

network={
        ssid="Vertigo"
        psk="D08C@wified"
}
EOL
exit
