@echo off
for %%n in (%0) do set folder=%%~dpn
set serv=%1
set nombre=%2
echo.

if not defined nombre set nombre=4
if /I %nombre%==infini set nombre=t
if /I %nombre%==t set arg=-&& goto debut
set arg=-n 
:debut
set arg2=%arg%%nombre%


if not defined serv goto duo1

if "%serv%"=="/?" (call %folder%\HelpPingDns.bat & goto fin)
if /I %serv%==help (call %folder%\HelpPingDns.bat & goto fin)
if /I %serv%==--help (call %folder%\HelpPingDns.bat & goto fin)
if /I %serv%==-help (call %folder%\HelpPingDns.bat & goto fin)
if /I %serv%==/help (call %folder%\HelpPingDns.bat & goto fin)
if %serv%==? (call %folder%\HelpPingDns.bat & goto fin)
if %serv%==-? (call %folder%\HelpPingDns.bat & goto fin)
if %serv%==--? (call %folder%\HelpPingDns.bat & goto fin)

if /I %serv%==cloud1 goto cloud1
if /I %serv%==cloud2 goto cloud2
if /I %serv%==google1 goto google1
if /I %serv%==google2 goto google2
if /I %serv%==duo1 goto duo1
if /I %serv%==duo2 goto duo2
if /I %serv%==duocloud goto duocloud
if /I %serv%==duogoogle goto duogoogle
if /I %serv%==router goto router
if /I %serv%==pihole goto pihole
if /I %serv%==dns goto pihole
if /I %serv%==proxmox goto proxmox
if /I %serv%==network goto network
if /I %serv%==local goto local

goto autre



:cloud1
echo DNS cloudflare primaire
ping -a 1.1.1.1 %arg2%
goto fin

:cloud2
echo DNS cloudflare secondaire
ping -a 1.0.0.1 %arg2%
goto fin

:google1
echo DNS google primaire
ping -a 8.8.8.8 %arg2%
goto fin

:google2
echo DNS google secondaire
ping -a 8.8.4.4 %arg2%
goto fin

:router
echo Router (192.168.0.1)
ping -a 192.168.0.1 %arg2%
goto fin

:pihole
echo Pi-Hole
ping -a 192.168.0.30 %arg2%
goto fin

:proxmox
echo Proxmox
ping -a 192.168.0.24 %arg2%
goto fin

:autre
echo server inconu - (%serv%)
ping -a %serv% -4 -n 1 -w 20 >nul 2>&1 && ping -a %serv% -4 %arg2% || ping -a %serv% %arg2%
goto fin

:duo1
echo DNS cloudflare primaire 
ping -a 1.1.1.1 %arg2%
echo.
echo DNS google primaire
ping -a 8.8.8.8 %arg2%
goto fin

:duo2
echo DNS cloudflare secondaire
ping -a 1.0.0.1 %arg2%
echo.
echo DNS google secondaire
ping -a 8.8.4.4 %arg2%
goto fin

:duocloud
echo DNS cloudflare primaire 
ping -a 1.1.1.1 %arg2%
echo.
echo DNS cloudflare secondaire
ping -a 1.0.0.1 %arg2%
goto fin

:duogoogle
echo DNS google primaire
ping -a 8.8.8.8 %arg2%
echo.
echo DNS google secondaire
ping -a 8.8.4.4 %arg2%
goto fin

:network
echo network
echo --------
echo router (192.168.0.1)
ping -a 192.168.0.1 %arg2%
echo.
echo Pi-Hole (192.168.0.30)
ping -a 192.168.0.30 %arg2%
goto fin

:local
echo local
echo ------
echo router (192.168.0.1)
ping -a 192.168.0.1 %arg2%
echo.
echo Takao 1G (192.168.0.20)
ping -a 192.168.0.20 %arg2%
echo.
echo Takao 2.5G (192.168.0.21)
ping -a 192.168.0.21 %arg2%
echo.
echo Proxmox (192.168.0.24)
ping -a 192.168.0.24 %arg2%
echo.
echo Pi-Hole/VPN (192.168.0.30)
ping -a 192.168.0.30 %arg2%
echo.
echo docker (192.168.0.31)
ping -a 192.168.0.31 %arg2%
goto fin


:fin
pause
