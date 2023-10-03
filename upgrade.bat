@echo off
echo.
:: Requiere chocolatey d'installer et privileges.bat dans le même dossier
call privileges.bat
if defined privileges (if not %privileges%==yes goto end) else goto end

for %%n in (%0) do set folder=%%~dpn
set choco=%1
set winget=%2
if not defined choco set choco=none
if not defined winget set winget=none
if /I %choco%==Y set choco=O
if /I %winget%==Y set winget=O
if /I %choco%==N if %winget%==N (echo Refus des upgrades... & goto end)

if /I %choco%==help (call %folder%HelpUpgrade.bat & goto end)
if /I %choco%==--help (call %folder%HelpUpgrade.bat & goto end)
if /I %choco%==-help (call %folder%HelpUpgrade.bat & goto end)
if /I %choco%==/help (call %folder%HelpUpgrade.bat & goto end)
if "%choco%"=="/?" (call %folder%HelpUpgrade.bat & goto end)
if %choco%==? (call %folder%HelpUpgrade.bat & goto end)
if %choco%==-? (call %folder%HelpUpgrade.bat & goto end)
if %choco%==--? (call %folder%HelpUpgrade.bat & goto end)

:choco
choco --version >nul 2>&1 || (echo Chocolatey n'est pas install/utilisable... & goto winget)
if /I %choco%==N goto winget
echo.
echo.
echo --- Chocolatey ---
echo.
echo -------------------------------------------------------------------------------------------------
choco outdated
echo -------------------------------------------------------------------------------------------------
if %choco%==none echo.
if /I %choco%==O timeout /T 5
if %choco%==none choice /C ON /M "Souhaitez-vous upgrade ces packets avec choco? " /T 30 /D O
echo.
echo -------------------------------------------------------------------------------------------------
echo.
if %ERRORLEVEL%==2 goto :winget
choco upgrade all --y
echo.
echo -------------------------------------------------------------------------------------------------
echo.

:winget
winget --version >nul 2>&1 || (echo Winget n'est pas install/utilisable... & goto end)
if /I %winget%==N goto end
echo.
echo --- Winget ---
echo.
echo -------------------------------------------------------------------------------------------------
winget upgrade
echo -------------------------------------------------------------------------------------------------
if %winget%==none echo.
if /I %winget%==O timeout /T 5
if %winget%==none choice /C ON /M "Souhaitez-vous upgrade ces packets avec winget? " /T 30 /D N
echo.
echo -------------------------------------------------------------------------------------------------
echo.
if %ERRORLEVEL%==2 goto :end 
winget upgrade --all -h
echo.
echo -------------------------------------------------------------------------------------------------
echo.

:end
