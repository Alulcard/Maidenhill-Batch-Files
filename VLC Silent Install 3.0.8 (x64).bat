:: Run this .bat file to silently install VLC.
:: Requires elevation in order to install. 
:: Running this file will cause CMD to appear on the screen and a UAC prompt 
:: https://wiki.videolan.org/Documentation:Installing_VLC/#Alternative
:: Written by Callum Wellard 27/02/2020

@echo off
set LanguageOption=1033
:: 1033 is English UK
set InstallerLocation=Z:\"SOFTWARE\VLC\vlc-3.0.8-win64"
:: Install location (Case and slash sensitive)

echo:
echo:
echo Installing VLC media player version 3.0.8. This prompt will automatically close itself after installation.
echo:
echo Please click "Run" when prompted.

@echo off
%InstallerLocation% /L=%LanguageOption% /S
:: "FilePath" /L="languagecode" /S

@echo off
if %ERRORLEVEL% NEQ 0 set FailedProgram=VLC
if %ERRORLEVEL% NEQ 0 GOTO error
if %ERRORLEVEL% EQU 0 echo VLC has been successfully installed.
if %ERRORLEVEL% EQU 0 GOTO exit

:error

	echo(
    echo VLC has failed to install correctly.
	pause
	GOTO exit
	:: pausing will allow the user to read the message and press a key to close
	
:exit
:: Closes the script and Command Prompt. (automatic if VLC is installed correctly)