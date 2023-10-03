@echo off
setlocal enabledelayedexpansion
set status=%1
del state.txt

echo -----------------------
echo.
for /L %%x in (168,1,168) do (
    for /L %%y in (0,1,0) do (
        for /L %%z in (1,1,255) do (

    ping -n 1 -w 300 192.%%x.%%y.%%z | find "TTL" > NUL
    IF ERRORLEVEL 1 (set state=DOWN) ELSE (set state=UP)
    rem & echo 192.%%x.%%y.%%z is DOWN
    rem & echo 192.%%x.%%y.%%z is UP

    echo 192.%%x.%%y.%%z is !state! >> state.txt
)))

if not defined status goto end
echo.
echo -----------------------
echo.
if %status%==up (call lecteur.bat state.txt | find "UP")
if %status%==down (call lecteur.bat state.txt | find "DOWN")
echo.
echo -----------------------
:end
