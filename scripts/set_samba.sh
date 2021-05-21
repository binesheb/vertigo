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


#reset Samba Password
sudo smbpasswd -a <username>
#restart Samba server
sudo /etc/init.d/samba restart

exit
