#!/bin/bash
echo "Downloading and Installing Base Files"
sleep 1
echo "Installing hostpad module"
sudo apt-get install hostapd -y --fix-missing
echo "Installing dnsmasq module"
sudo apt-get install dnsmasq -y --fix-missing
sleep 3
clear
echo "Stopping Services..."
sleep 2
sudo systemctl unmask hostapd
sudo systemctl disable hostapd
sudo systemctl disable dnsmasq
sleep 2
echo "Services Stopped"
sleep 2
clear

#################################
echo "Creating Required configuration File"
sleep 1
cat > /etc/hostapd/hostapd.conf << EOL
#2.4GHz setup wifi 80211 b,g,n
interface=wlan0
driver=nl80211
ssid=VertigoRacing
hw_mode=g
channel=8
wmm_enabled=0
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=vertigo123
wpa_key_mgmt=WPA-PSK
wpa_pairwise=CCMP TKIP
rsn_pairwise=CCMP

#80211n - Change GB to your WiFi country code
country_code=IN
ieee80211n=1
ieee80211d=1
EOL

sudo mv /boot/vertigo/hostapd  /etc/default/


##############################
echo "Creating dnsmasq file"
sleep 1
cat > /etc/dnsmasq.conf << EOL
#AutoHotspot config
interface=wlan0
bind-dynamic 
server=8.8.8.8
domain-needed
bogus-priv
dhcp-range=192.168.50.100,192.168.50.200,12h
EOL
sudo rm /boot/vertigo/dnsmasq.conf -r
cat /etc/dnsmasq.conf
sleep 3
clear
cat /etc/network/interfaces

sudo sed -i 's/#net.ipv4.ip_forward/net.ipv4.ip_forward/g' /etc/sysctl.conf

echo "editing dhcpcd.conf"
cat >> /etc/dhcpcd.conf << EOL
nohook wpa_supplicant
EOL

echo "Creating Service file"
cat > /etc/systemd/system/autohotspot.service << EOL
[Unit]
Description=Automatically generates an Internet Hotspot when a known SSID is not in range
After=multi-user.target
[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/bin/autohotspotN
[Install]
WantedBy=multi-user.target
EOL
echo "Service Created"
sleep 3
echo "Downloading autohotspot script"
sleep 3
#sudo curl -l https://www.raspberryconnect.com/autohotspotN/autohotspotn-95-4/autohotspotN.txt -o /boot/vertigo/autohotspotN -#
echo "copy script"
sleep 3
sudo mv /boot/vertigo/autohotspotN /usr/bin/
echo "exceuteable file"
sleep 3
sudo chmod +x /usr/bin/autohotspotN
sleep 3
echo "Start AutoHotspot service"
sleep 3
sudo systemctl enable autohotspot.service
echo "Auto Hotspot Service Started"
sleep 30
clear
echo "Setting up cron job"
(crontab -l ; echo "*/30 * * * * sudo /usr/bin/autohotspotN >dev/null 2>&1") | sort - | uniq - | crontab -
echo "Restarting the node in 10seconds"
sleep 10
echo "Self Destruct"
sudo rm /boot/vertigo/install_hotspot.sh
#sudo reboot

