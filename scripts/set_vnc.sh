#!/bin/bash
echo "Enable X11 on LCD"
vncserver -geometry 1280x1024 :1
sleep 1000000
vncserver -kill :1
exit
