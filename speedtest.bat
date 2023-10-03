@echo off

set speedtest=%USERPROFILE%\speedtest.exe

for %%n in (%0) do set folder=%%~dpn
set arg=%1
if not defined arg set arg=VooL

Rem Help
if %arg%==/? (call %folder%\HelpSpeedtest.bat & goto fin)
if /I %arg%==help (call %folder%\HelpSpeedtest.bat & goto fin)
if /I %arg%==--help (call %folder%\HelpSpeedtest.bat & goto fin)
if /I %arg%==-help (call %folder%\HelpSpeedtest.bat & goto fin)
if /I %arg%==/help (call %folder%\HelpSpeedtest.bat & goto fin)
if %arg%==? (call %folder%\HelpSpeedtest.bat & goto fin)
if %arg%==-? (call %folder%\HelpSpeedtest.bat & goto fin)
if %arg%==--? (call %folder%\HelpSpeedtest.bat & goto fin)


Rem alias
if /I "%arg%"=="proxibxl" set arg=ProximusBxl
if /I "%arg%"=="proxisch" set arg=ProximusSch
if /I "%arg%"=="cube" set arg=Cu.be
if /I "%arg%"=="duoproxi" set arg=DuoProximus
if /I "%arg%"=="proxiorange" set arg=ProximusOrange

Rem goto serv unique
if /I %arg%==VooBxl goto VooBxl
if /I %arg%==VooL goto VooL
if /I %arg%==ProximusBxl goto ProximusBxl
if /I %arg%==ProximusSch goto ProximusSch
if /I %arg%==Orange goto Orange
if /I %arg%==Cu.be goto Cu.be
if /I %arg%==Auto goto Auto

Rem goto multi serv
if /I %arg%==DuoVoo goto DuoVoo
if /I %arg%==DuoProximus goto DuoProximus
if /I %arg%==VooOrange goto VooOrange
if /I %arg%==ProximusOrange goto ProximusOrange
if /I %arg%==FAI goto FAI
if /I %arg%==FAIFULL goto FAIFULL
if /I %arg%==Full goto Full


:VooBxl
echo Bruxelles - Voo
%speedtest% -s 45280
echo.
goto fin

:VooL
echo Liege - Voo
%speedtest% -s 23320
echo.
goto fin

:ProximusBxl
echo Bruxelles - Proximus
%speedtest% -s 12627
echo.
goto fin

:ProximusSch
echo Schaarbeek - Proximus
%speedtest% -s 10986
echo.
goto fin

:Orange
echo Bruxelles - Orange
%speedtest% -s 30594
echo.
goto fin

:Cu.be
echo Diegem - Cu.be Solutions
%speedtest% -s 2848
echo.
goto fin

:Auto
echo automatique
%speedtest%
echo.
goto fin



:DuoVoo
echo DuoVoo
echo Liege - Voo
%speedtest% -s 23320
echo.
echo Bruxelles - Voo
%speedtest% -s 45280
echo.
goto fin

:DuoProximus
echo DuoProximus
echo Schaarbeek - Proximus
%speedtest% -s 10986
echo.
echo Bruxelles - Proximus
%speedtest% -s 12627
echo.
goto fin

:FAI
echo FAI
echo Liege - Voo
%speedtest% -s 23320
echo.
echo Schaarbeek - Proximus
%speedtest% -s 10986
echo.
echo Bruxelles - Orange
%speedtest% -s 30594
echo.
goto fin

:VooOrange
echo Voo + Orange
echo Liege - Voo
%speedtest% -s 23320
echo.
echo Bruxelles - Voo
%speedtest% -s 45280
echo.
echo Bruxelles - Orange
%speedtest% -s 30594
echo.
goto fin

:ProximusOrange
echo Proximus + Orange
echo Schaarbeek - Proximus
%speedtest% -s 10986
echo.
echo Bruxelles - Proximus
%speedtest% -s 12627
echo.
echo Bruxelles - Orange
%speedtest% -s 30594
echo.
goto fin

:FAIFULL
echo FAI-Full
echo Liege - Voo
%speedtest% -s 23320
echo.
echo Bruxelles - Voo
%speedtest% -s 45280
echo.
echo Schaarbeek - Proximus
%speedtest% -s 10986
echo.
echo Bruxelles - Proximus
%speedtest% -s 12627
echo.
echo Bruxelles - Orange
%speedtest% -s 30594
echo.
goto fin

:Full
echo Full
echo Liege - Voo
%speedtest% -s 23320
echo.
echo Bruxelles - Voo
%speedtest% -s 45280
echo.
echo Schaarbeek - Proximus
%speedtest% -s 10986
echo.
echo Bruxelles - Proximus
%speedtest% -s 12627
echo.
echo Bruxelles - Orange
%speedtest% -s 30594
echo.
echo Diegem - Cu.be Solutions
%speedtest% -s 2848
echo.
echo automatique
%speedtest%
goto fin



:fin
pause
