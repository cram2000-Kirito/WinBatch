@echo off
set primary_serv = "%%1,0x9"
set secondary_serv = "%%2"

w32tm /config /manualpeerlist:"%primary_serv% %secondary_serv% time.windows.com" /syncfromflags:manual /reliable:YES /update
net stop w32time
timeout /T 1 /NOBREAK
net start w32time
timeout /T 1 /NOBREAK
w32tm /resync
timeout /T 10
w32tm /query /peers
w32tm /query /status

:end