@echo off
set server=%1
set nbr_request=%2

setlocal enabledelayedexpansion

:: Vérification des arguments
if not defined server (echo $ [%computername%]: Usage: ^<serveur^> [nombre_de_pings] & pause & goto end)

:: Si le nombre de pings n'est pas spécifié, le définir par défaut à 4
if not defined nbr_request set "nbr_request=4"
if %nbr_request% lss 2 set "nbr_request=2"

:: Récupération du nom du serveur
for /f "tokens=3 delims= " %%n in ('nslookup %server% 2^>nul ^| find "Nom :"') do (set "server_name=%%n")
if not defined server_name set "server_name=%server%"

:: Exécution de la commande ping et traitement des résultats
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
for /L %%i in (1,1,%nbr_request%) do (
    for /f "tokens=7,10 delims== " %%a in ('ping -n 1 %server% ^| find "temps="') do (
        set "current_latency=%%a"
        set "current_TTL=%%b"
    )
    if defined cpt (set /a "cpt+=1") else (set cpt=1)
    if defined current_latency (
        if defined request (set /a "request+=1") else (set "request=1")

        if defined latency (set /a "latency+=!current_latency!") else (set "latency=!current_latency!")
        if defined min_latency (
            if !current_latency! lss !min_latency! set "min_latency=!current_latency!"
        ) else (set "min_latency=!current_latency!")
        if defined max_latency (
            if !current_latency! gtr !max_latency! set "max_latency=!current_latency!"
        ) else (set "max_latency=!current_latency!")

        if defined last_latency (
            if !last_latency! gtr !current_latency! set /a "current_gigue=!last_latency!-!current_latency!"
            if !last_latency! lss !current_latency! set /a "current_gigue=!current_latency!-!last_latency!"
            if !last_latency!==!current_latency! set /a "current_gigue=0"

            if defined gigue (set /a "gigue+=!current_gigue!") else (set "gigue=!current_gigue!")
            if defined min_gigue (
                if !current_gigue! lss !min_gigue! set "min_gigue=!current_gigue!"
            ) else (set "min_gigue=!current_gigue!")
            if defined max_gigue (
                if !current_gigue! gtr !max_gigue! set "max_gigue=!current_gigue!"
            ) else (set "max_gigue=!current_gigue!")

            echo $ [!cpt!/%nbr_request%] $ Réponse de %server_name%: TTL=!current_TTL!, latence=!current_latency!ms, gigue=!current_gigue!ms

        ) else (echo $ [!cpt!/%nbr_request%] $ Réponse de %server_name%: TTL=!current_TTL!, latence=!current_latency!ms)
        set "last_latency=!current_latency!"
    ) else (
        echo $ [!cpt!/%nbr_request%] $ Impossible à joindre %server_name%
    )
    timeout /t 1 >nul
)

echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if defined request (
    set /a "latency=%latency%/%request%"
    set /a "gigue=%gigue%/(%request%-1)"

    echo $ Pings:   min: %min_latency%ms / moy: !latency!ms / max: %max_latency%ms
    echo $ Gigues:  min: %min_gigue%ms / moy: !gigue!ms / max: %max_gigue%ms
) else (
    set "request=0"
)

set /a "request_echec=%nbr_request%-%request%"

echo $ Packets: env: %nbr_request% / reçues: %request% / Perdus: %request_echec%
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
:end
endlocal