@echo off
set tps=%*
if not defined tps set tps=10

if %tps%==a (shutdown -a 2>nul && echo Arret suspendu avec succes || echo Aucun arret etait en cours)
if %tps%==a goto end

rem echo + findstr se comportant comme un if (attention d'utiliser findstr et non find et de respecter les espace)
echo %tps%|findstr /r "[^0-9]" > nul && (echo Veuillez fournir un chiffre & goto end)
set tpsmin=%tps%
set /a tps=%tps% * 60
shutdown /s /t %tps% 2>nul && echo Arret defini dans %tpsmin% minute(s) || echo Un arret etait deja programme

:end