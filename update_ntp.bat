@echo off
set primary_serv=%1,0x9
set secondary_serv=%2
 
echo primary serv: %primary_serv%
echo secondary: %secondary_serv%
choice /n /c ON /m "Les serveurs sont-il correctes?[O,N]" & if errorlevel 2 (goto end)
w32tm /config /manualpeerlist:"%primary_serv% %secondary_serv% time.windows.com" /syncfromflags:manual /reliable:YES /update
net stop w32time
timeout /T 1 /NOBREAK
net start w32time
timeout /T 1 /NOBREAK
w32tm /resync
echo.
echo - - - - - - 
echo peers
echo.
w32tm /query /peers
echo.
echo - - - - - - 
echo status
echo.
w32tm /query /status
 
:end