@echo off
:: Verifie si l'enabledelayedexpansion est actif
set status_delayed_expansion=modified
set "status_delayed_expansion=!status_delayed_expansion!_changed"

if not "%status_delayed_expansion%"=="modified_changed" (
    echo $ [%computername%]: Veuillez ajouter au script appelant la commande suivante:
    echo $ [%computername%]: setlocal enabledelayedexpansion
    goto end
)
goto %1


:: check le hash
:def_hash_check
set hash_type=%2
if /i "%hash_type%"=="MD5" (
    echo $ [%computername%]: Algorithme de hachage valide: MD5
) else if /i "%hash_type%"=="SHA1" (
    echo $ [%computername%]: Algorithme de hachage valide: SHA1
) else if /i "%hash_type%"=="SHA256" (
    echo $ [%computername%]: Algorithme de hachage valide: SHA256
) else if /i "%hash_type%"=="SHA384" (
    echo $ [%computername%]: Algorithme de hachage valide: SHA384
) else if /i "%hash_type%"=="SHA512" (
    echo $ [%computername%]: Algorithme de hachage valide: SHA512
) else (
    echo $ [%computername%]: Algorithme de hachage non pris en charge: %hash_type%
    echo $ [%computername%]: Les algorithmes pris en charge sont: MD5, SHA1, SHA256, SHA384, SHA512.
    set "hash_type=none"
    goto end
)
goto end

:: Calcule le hachage du fichier spécifié
:def_hash_gen
set "file=%2"
set "hash_type=%3"

for /f "delims=" %%i in ('certutil -hashfile %file% %hash_type%') do (
    if not defined cpt (set cpt=1) else (set /a cpt=1 + !cpt!)
    if !cpt!==2 (set "hash=%%i")
)
set "cpt=0"
goto end


:def_checksum
set checksum=%2
set hash=%3
set hash_type=%4
set file=%5
:: check si un hash ou un fichier a été passé
echo %checksum% | find "." >nul
if errorlevel 1 (
    for %%A in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do (
        set "checksum=!checksum:%%A=%%A!"
    )
    if /i !checksum!==!hash! (
        echo $ [%computername%]: Le fichier %file% correspond bien au hash que vous avez fourni:
        echo $ [%computername%]: !hash_type!: !checksum!
    ) else (
        echo $ [%computername%]: Le fichier %file% ne correspond pas au hash que vous avez fourni:
        echo $ [%computername%]: !hash_type!: !checksum!
    )

) else (
    if exist "%checksum%" (
        for /f "tokens=1,2 delims=: " %%a in (%checksum%) do (
            if /i %%a==%hash_type% (
                if /i %%b==!hash! (
                    echo $ [%computername%]: Le fichier %file% correspond bien au hash repris dans le document:
                    echo $ [%computername%]: !hash_type!: %%b
                ) else (
                    echo $ [%computername%]: Le fichier %file% ne correspond pas au hash repris dans le document:
                    echo $ [%computername%]: !hash_type!: %%b
                )
            ) else (
                echo $ [%computername%]: L'algorithme de hashage ne sont pas les mêmes ^(%hash_type% =/= %%a^)
            )
        )
    ) else (
        echo %hash_type%: %hash%> "%checksum%" && echo $ [%computername%]: L'écriture du hash dans le fichier %checksum% c'est bien effectuée.
    )
)
goto end

:end
