#!/bin/bash
echo "Enable File sharing on Raspi"
sudo apt-get install samba samba-common-bin -y
sudo nano /etc/samba/smb.conf

[Vertigo Admin]
comment = Pi shared folder
path = /
browseable = yes
writeable = Yes
only guest = no
create mask = 0777
directory mask = 0777
public = yes
guest ok = yes


# Reset Samba password interactively.
# Replace USERNAME with the intended local account before running this script.
sudo smbpasswd -a USERNAME
# Restart Samba server
sudo /etc/init.d/samba restart

exit
