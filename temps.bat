@echo off
set proccess=%1
set tps=%2
set unite=%3

:: Tous ce trouvant entre <> est optionnelle et dispose donc d'un paramettre par défaut
:: time.bat est une micro librairie servant à convertir les jours/heures/minutes en secondes et inversement

:: Input <[proccess{TimeToSec|SecToTime} - determine le sens de conversion]>
:: Input [tps{[0-9]} - Le temps à convertir (avec vérification userinput)]
:: Input <[unite{[jJ|dD|hH|mM|sS]} - permet de spécifier l'unité du temps ]>

:: TimeToSec
:: Ouput [tps = temps entré à l'origine]
:: Ouput [sec = temps en seconde]
:: Ouput [unite = unité d'origine (hormis pour j qui devient d)]

:: SecToTime
:: Output [d = days / jours]
:: Output [h = hours / heures]
:: Output [m = minutes]
:: Output [s = secondes]
:: Usage echo %d%d %h%h:%m%m:%s%s


if not defined proccess set proccess=TimeToSec
if not defined unite set unite=s



:error
echo %tps%|findstr /r "[^0-9]" > nul && (echo ^$ ^[%computername%^]: Error: caracteres no-valide - caracteres valide [0-9] & set /p tps="Veuillez introduire votre temps: "& goto error)
set /a tps=%tps%-0 2>nul || echo ^$ ^[%computername%^]: Le nombre maximum est de 999 999 999 && set /p tps="Entrez temps inferieur: " && goto error
echo %unite%|findstr /r "[^jJ|[^dD|^hH|^mM|^sS]" > nul && (echo ^$ ^[%computername%^]: Error: caracteres no-valide - caracteres valide [j-h-m-s] & set /p unite="Veuillez introduire l'unite de votre temps: "& goto error)



:TimeToSec
rem unite
if /I %unite%==j set unite=d
if /I %unite%==d set /a sec=%tps%*24*60*60 2>nul || echo ^$ ^[%computername%^]:  Le nombre maximum est de 999 999 999 && goto error
if /I %unite%==h set /a sec=%tps%*60*60 2>nul || echo ^$ ^[%computername%^]: Le nombre maximum est de 999 999 999 && goto error
if /I %unite%==m set /a sec=%tps%*60 2>nul || echo ^$ ^[%computername%^]: Le nombre maximum est de 999 999 999 && goto error
if /I %unite%==s set sec=%tps% 2>nul || echo ^$ ^[%computername%^]: Le nombre maximum est de 999 999 999 && goto error
if /I %proccess%==TimeToSec goto end



rem Second to Day Hour Minute Seconde
set d=0
set h=0
set m=0
set s=%sec%
:SecToTime
if %s% GEQ 86400 set /a d=%d%+1& set /a s=%s%-86400 & goto SecToTime
if %s% GEQ 3600 set /a h=%h%+1& set /a s=%s%-3600 & goto SecToTime
if %s% GEQ 60 set /a m=%m%+1& set /a s=%s%-60 & goto SecToTime
if %s% LSS 60 set /a s=%s%
rem echo time: %d%d %h%h:%m%m:%s%s

:end