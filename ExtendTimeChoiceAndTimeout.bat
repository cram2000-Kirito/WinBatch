@echo off
set proccess=%1
set sec=%2
set wait=%3
set break=%3
set sentenceTime=%4
set defaultChoice=%5
set possibilityChoice=%6

:: Tous ce trouvant entre <> est optionnelle et dispose donc d'un paramettre par défaut
:: ExtendTimeChoiceAndTimeout.bat est une micro librairie servant géré les temps suppérieurs à ce que les commandes Choice et Timeout peuvent prendre.
:: Elle prent également les temps normaux des commandes.

:: /!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\
:: /!\/!\/!\ nécéssite la librairie temps.bat /!\/!\/!\
:: /!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\/!\

:: Input [proccess{ExtendChoice|ExtendTimeout} - determine quelle commande doit être utiliser à la fin]
:: Input [sec{[0-9]} - Le temps en secondes (! nécéssite la librairie temps.bat !)]
:: Input <[wait{"caracteres"} - permet de spécifier une phrase pour choice]>
:: Input <[break{break|nobreak} - permet d'ajoute l'argument nobreak au timeout]>
:: Input <[sentenceTime{"caracteres"} - permet de spécifier une phrase pour le compte à rebours (phrase suivit de ' d h:m:s')]>
:: Input <[defaultChoice{1 caracteres} - permet de spécifier le caractères par défaut]>
:: Input <[possibilityChoice{caracteres coller entre eux} - permet de spécifier les caractères de choix pour choice]>

:: ExtendChoice Output:
:: Va effectuer des timeout (sans nobreak) juste que le temps permet de faire un choice
:: ExtendTimeout Output:
:: Va effectuer des timeout jusque le temps soit terminer


if not defined sentenceTime set "sentenceTime=Un choix automatique se fera dans"
if defined sentenceTime set sentenceTime=%sentenceTime:~1,-1%
if not defined proccess set proccess=ExtendChoice
if %proccess%==ExtendChoice goto ExtendChoice
if %proccess%==ExtendTimeout goto ExtendTimeout
goto end

:ExtendChoice
rem limite time choice is 9 999s
if not defined wait set wait="Pour oui appuyer sur O et pour non appuyer sur N"
if not defined defaultChoice set defaultChoice=O
if not defined possibilityChoice set possibilityChoice=ON
call %userprofile%\temps.bat SecToTime %sec% s
echo ^$ ^[%computername%^]: %sentenceTime% %d%d %h%h:%m%m:%s%s
if %sec% LEQ 9999 choice /C %possibilityChoice% /M %wait% /T %sec% /D %defaultChoice% & goto end
if %sec% GTR 9999 if %sec% GTR 99999 (set /a sec=%sec%-99999 & timeout 99999 && goto ExtendChoice) else (goto betweentwo)
:betweentwo
set /a sectimeout=%sec%-9999
set sec=9999
timeout /t %sectimeout%
goto ExtendChoice

:ExtendTimeout
rem limite time choice is 99 999s
if not defined break set break=break
if %break%==nobreak set break=/nobreak
if not %break%==/nobreak set "break="
call %userprofile%\temps.bat SecToTime %sec% s
echo ^$ ^[%computername%^]: %sentenceTime% %d%d %h%h:%m%m:%s%s
if %sec% LEQ 99999 timeout /t %sec% %break%& goto end
if %sec% GTR 99999 set /a sec=%sec%-99999 & timeout /t 99999 %break%& goto ExtendTimeout

:end