@echo off
net session >nul 2>&1
if %errorlevel% EQU 0 (
    echo ^$ ^[%computername%^]: Admin PRIVILEGES Detected!
    set "privileges=yes"
) else (
    echo ^$ ^[%computername%^]: Admin privileges not detected...
    set "privileges=no"
)