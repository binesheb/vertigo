Mode con cols=98 lines=16 & Color 9E
Title SSH to Vertigo Racing Compute Module by @binesheb
:ping
set target=192.168.29.243
ping %target% -n 1 | find "TTL="
if errorlevel==1 goto ping
start ssh pi@192.168.29.243
pause
echo 
goto ping
