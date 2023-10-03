@echo off
setlocal
set shut=%1
set tps=%2
set unite=%3

::

if not defined shut set shut=s
if not defined tps set tps=10
if not defined unite set unite=s

echo.
if /I %shut%==a goto annule

if /I %shut%==off set shut=s
if /I %shut%==poweroff set shut=s
if /I %shut%==shutdown set shut=s
if /I %shut%==now set shut=s
if /I %shut%==s set "shut=/s" && set name=Arret

if /I %shut%==reboot set shut=r
if /I %shut%==restart set shut=r
if /I %shut%==renew set shut=r
if /I %shut%==r set "shut=/r" && set name=Redemarrage

if /I %shut%==veille set shut=h
if /I %shut%==hiberne set shut=h
if /I %shut%==hiberner set shut=h
if /I %shut%==h set "shut=/h"

call %userprofile%\temps.bat TimeToSec %tps% %unite%

if not %shut%==/h goto power
echo.
call %userprofile%\ExtendTimeChoiceAndTimeout.bat ExtendChoice %sec% "$[%computername%]: Souhaitez-vous mettre en veille immediatement? " "Mise en veille automatique dans"
if %ERRORLEVEL%==2 echo ^$ ^[%computername%^]: Mise en veille annulee & goto :end
shutdown /h
goto end

:annule
shutdown -a 2>nul && echo ^$ ^[%computername%^]: Arret ou redemarrage annuler! || echo ^$ ^[%computername%^]: Aucun arret ou redemarrage n'etait prevu...
goto end

:power
call %userprofile%\temps.bat SecToTime %sec%
shutdown %shut% /t %sec% 2>nul && echo ^$ ^[%computername%^]: %name% defini dans %d%d %h%h:%m%m:%s%s || echo ^$ ^[%computername%^]: Un arret ou redemarrage etait deja programme (veuillez d'abord l'annuler via "a")
echo.
:end
