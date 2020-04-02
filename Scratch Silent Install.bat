:: Run this .bat file to silently install Scratch.
:: Requires elevation in order to install. 
:: Running this file will cause CMD to appear on the screen and a UAC prompt
:: Written by Callum Wellard 05/03/2020

:: Change these variables to alter the installation of Scratch
@echo off
set InstallAllUsers=allusers
:: allusers / **empty**
set InstallerLocation=Z:\SOFTWARE\Scratch\"Scratch Desktop Setup 3.6.0"
:: Install location (Case and slash sensitive)

echo:
echo:
echo Installing Scratch. This prompt will automatically close itself after installation.
echo:

if [%InstallAllUsers%] == [allusers] echo Install for all users = Enabled
if [%InstallAllUsers%] == [] echo Install for all users = Disabled

echo:
echo Please click "Run" if prompted.

%InstallerLocation% /S %InstallAllUsers%
:: "FilePath" Silent Instal InstallAllUsers

if %ERRORLEVEL% NEQ 0 set FailedProgram=Scratch
if %ERRORLEVEL% NEQ 0 GOTO error
if %ERRORLEVEL% EQU 0 echo Scratch has been successfully installed.
if %ERRORLEVEL% EQU 0 GOTO exit

:error

	echo(
    echo Scratch has failed to install correctly.
	pause
	GOTO exit
	:: pausing will allow the user to read the message and press a key to close
	
:exit
:: Closes the script and Command Prompt. (automatic if Scratch is installed correctly)