@echo off
setlocal
set tps=%1
set unite=%2
if not defined tps (set tps=10 & set unite=s)
if not defined unite set unite=m

call temps.bat TimeToSec %tps% %unite%

:veille
call %userprofile%\ExtendTimeChoiceAndTimeout.bat ExtendChoice %sec% "Souhaitez-vous mettre en veille immediatement? " "Mise en veille automatique dans"
if %ERRORLEVEL%==2 goto :end
shutdown /h
rem rundll32.exe powrprof.dll, SetSuspendState Sleep
endlocal
:end