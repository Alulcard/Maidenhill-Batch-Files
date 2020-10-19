:: Run this .bat file to silently install ProgramName.
:: Running this file will cause CMD to appear on the screen and a UAC prompt
:: https://www.microsoft.com/en-gb/download/details.aspx?id=10056
:: Written by Callum Wellard 19/10/2020

@echo off
set ProgramName=Kodu

@echo off
echo:
echo:

echo Installing %ProgramName%. This prompt will automatically close itself after installation.
@echo off
echo:
echo:
echo Please click "Run" if prompted.

@echo off
msiexec /i "Z:\SOFTWARE\Kodu\KoduSetup 1.5.53.0.msi" /passive
 	:: /quiet
		:: Quiet mode, no user interaction
	:: /passive
		:: Unattended mode - progress bar only 

if %ERRORLEVEL% NEQ 0 GOTO error
if %ERRORLEVEL% EQU 0 echo %ProgramName% has been successfully installed.
if %ERRORLEVEL% EQU 0 GOTO exit

:error

	echo(
    echo %ProgramName% has failed to install correctly.
	pause
	GOTO exit
	:: pausing will allow the user to read the message and press a key to close
	
:exit
:: Closes the script and Command Prompt. (Automatic if %ProgramName% is installed correctly)