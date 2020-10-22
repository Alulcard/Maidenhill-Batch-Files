:: Run this .bat file to silently install Java.
:: This file will install Java version 8.261.
:: Requires elevation in order to install. 
:: Running this file will cause CMD to appear on the screen and a UAC prompt
:: Removing old version of Java will cause an addition Command Prompt box to appear for a few seconds
:: https://docs.oracle.com/javase/8/docs/technotes/guides/install/config.html
:: Written by Callum Wellard 27/02/2020

:: Change these variables to alter the installation of Java
@echo off
set InstallSilentData=Enable
:: Enable / Disable (Case sensitive)
set RemoveOutOfDate=1
:: Boolean
set InstallerLocation="Z:\SOFTWARE\Java\jre-8u271-windows-x64.exe"
:: Install location (Case and slash sensitive)

echo:
echo:
echo Installing Java. This prompt will automatically close itself after installation.
echo:

if [%InstallSilentData%] == [Enable] echo Silent install = Enabled
if [%InstallSilentData%] == [Disable] echo Silent install = Disabled

if [%RemoveOutOfDate%] == [1] echo Remove out of date versions = Enabled
if [%RemoveOutOfDate%] == [0] echo Remove out of date versions = Disabled

echo:
echo Please click "Run" if prompted.

%InstallerLocation% INSTALL_SILENT=%InstallSilentData% REMOVEOUTOFDATEJRES=%RemoveOutOfDate%
:: "FilePath" INSTALL_SILENT=Enable/Disable REMOVEOUTOFDATEJRES=1/0

if %ERRORLEVEL% NEQ 0 set FailedProgram=Java
if %ERRORLEVEL% NEQ 0 GOTO error
if %ERRORLEVEL% EQU 0 echo Java has been successfully installed.
if %ERRORLEVEL% EQU 0 GOTO exit

:error

	echo(
    echo Java has failed to install correctly.
	pause
	GOTO exit
	:: pausing will allow the user to read the message and press a key to close
	
:exit
:: Closes the script and Command Prompt. (automatic if Java is installed correctly)
