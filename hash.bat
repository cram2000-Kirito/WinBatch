@echo off
rem Recupère les arguments
set "file=%1"
set "hash_type=%2"
set "checksum=%3"
set folder=%~dp0

if not exist %folder%\fonction_hash.bat (
    echo Le fichier fonction_hash.bat n'existe pas...
    goto end
)

setlocal enabledelayedexpansion
if not defined file (echo $ [%computername%]: Usage: ^<fichier^> ^<hash^> [fichier contenant le hash] & pause & goto end)
if not defined hash_type (echo $ [%computername%]: Usage: ^<fichier^> ^<hash^> [Le hash ou fichier contenant le hash] & pause & goto end)
if not exist %file% (echo $ [%computername%]: Le fichier %file% n'existe pas à l'endroit d'exécution actuel ^(%CD%^\^) & goto end)

echo - - - - - - - - - -
call %folder%\fonction_hash.bat :def_hash_check %hash_type%
if "%hash_type%"=="none" goto end
call %folder%\fonction_hash.bat :def_hash_gen %file% %hash_type%

echo $ [%computername%]: Hash calculé:
echo $ [%computername%]: %hash_type%: %hash%

if defined checksum (
    call %folder%\fonction_hash.bat :def_checksum %checksum% %hash% %hash_type% %file%
)


:end
echo - - - - - - - - - -
endlocal