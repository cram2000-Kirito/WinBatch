@echo off
echo.

for %%n in (%0) do set folder=%%~dpn
set cheminfichier=%*
set arg=%*
if not defined arg (call %folder%\HelpLecteur.bat & goto end)

if "%arg%"=="/?" (call %folder%\HelpLecteur.bat & goto end)
if /I %arg%==help (call %folder%\HelpLecteur.bat & goto end)
if /I %arg%==--help (call %folder%\HelpLecteur.bat & goto end)
if /I %arg%==-help (call %folder%\HelpLecteur.bat & goto end)
if /I %arg%==/help (call %folder%\HelpLecteur.bat & goto end)
if %arg%==? (call %folder%\HelpLecteur.bat & goto end)
if %arg%==-? (call %folder%\HelpLecteur.bat & goto end)
if %arg%==--? (call %folder%\HelpLecteur.bat & goto end)

For /f "tokens=*" %%a In (%cheminfichier%) do (echo %%a)

:end
