@echo off
set "file1=%1"
set "file2=%2"
set "hash_type=%3"
set folder=%~dp0

echo - - - - - - - - - -
setlocal enabledelayedexpansion
if not exist %folder%fonction_hash.bat (
    echo Le fichier fonction_hash.bat n'existe pas...
    goto end
)

if not defined file1 (echo $ [%computername%]: Usage: ^<fichier1^> ^<fichier2^> [hash] & pause & goto end)
if not defined file2 (echo $ [%computername%]: Usage: ^<fichier1^> ^<fichier2^> [hash] & pause & goto end)

if not exist %file1% (echo $ [%computername%]: Le fichier %file1% n'existe pas à l'endroit d'exécution actuel ^(%CD%^\^) & goto end)
if not exist %file2% (echo $ [%computername%]: Le fichier %file2% n'existe pas à l'endroit d'exécution actuel ^(%CD%^\^) & goto end)



if not defined hash_type set "hash_type=SHA256"
if hash_type=="" set "hash_type=SHA256"


call %folder%fonction_hash.bat :def_hash_check %hash_type%
if "%hash_type%"=="none" goto end

call %folder%fonction_hash.bat :def_hash_gen %file1% %hash_type%
set hash_file1=!hash!
call %folder%fonction_hash.bat :def_hash_gen %file2% %hash_type%
set hash_file2=!hash!

if %hash_file1%==%hash_file2% (
    echo $ [%computername%]: Les fichiers %file1% et %file2% sont identiques!
) else (
    echo $ [%computername%]: Les fichiers %file% et %file2% sont différents!
)

:end
echo - - - - - - - - - -
endlocal