@echo off
for %%n in (%0) do set folder=%%~dpn
set chemin=%1
set dernier=%chemin:~-1%

if "%dernier%"=="\" (call :supp)

lsd %chemin% %2 %3 %4 %5 %6 %7 %8 %9
break

:supp
set chemin=%chemin:~0,-1%