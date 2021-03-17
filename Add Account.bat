:: Check to see if script is running as administrator.
@echo off
REG QUERY HKU\S-1-5-19\Environment >NUL 2>&1
IF %ERRORLEVEL% EQU 0 goto :START_SCRIPT

echo =====================================================
echo This script needs to be executed as an administrator.
echo =====================================================
echo.
PAUSE

:START_SCRIPT
set Username="ChangeYourUsernameHere"
set Password="ChangeYourPasswordHere"

net user %Username% %Password% /ADD

PAUSE
