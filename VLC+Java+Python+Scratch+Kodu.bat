:: :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: ::
:: Run this .bat file to silently install VLC, Java, Python, and Scratch.                             ::
:: May require elevation in order to install.                                                         ::
:: Running this file will cause CMD to appear on the screen                                           ::
:: Removing old version of Java may cause an addition Command Prompt box to appear for a few seconds ::
:: Written by Callum Wellard 05/03/2020                                                               ::
:: :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: ::

@echo off
set VLCInstallerLocation="Z:\SOFTWARE\VLC\vlc-3.0.11-win64.exe" 
set JavaInstallerLocation="Z:\SOFTWARE\Java\JavaSetup8u261"
set PythonInstallerLocation="Z:\SOFTWARE\Python\python-3.7.4"
set ScratchInstallerLocation="Z:\SOFTWARE\Scratch\Scratch Desktop Setup 3.6.0"

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: ::
:: Variables. Change these to adjust the installion of each software ::
:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: ::

@echo off
set VLCLanguageOption=1033
:: 1033 is English UK

set JavaInstallSilentData=Enable
:: Enable / Disable (Case sensitive)
set JavaRemoveOutOfDate=1
:: Boolean

set PythonAllUsers=1
:: Boolean
set PythonInstallAndScriptsDirectories=1
:: Boolean
set PythonTestScripts=0
:: Boolean

set ScratchInstallAllUsers=allusers
:: allusers / **empty**

:Start

	echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	echo:
	echo This program will install VLC, Java, Python, Scratch, and Kodu.
	echo This can take a few minutes. Please be patient.
	echo:
	echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

	GOTO VLC

:VLC

	echo:
	echo Installing VLC media player version 3.0.11.

	@echo off
	:: "FilePath" /L="languagecode" /S
	%VLCInstallerLocation% /L=%VLCLanguageOption% /S

	:: IF %ERRORLEVEL% NEQ 0 Echo An error was found
	:: IF %ERRORLEVEL% EQU 0 Echo No error found
	echo:
	if %ERRORLEVEL% NEQ 0 set FailedProgram=VLC
	if %ERRORLEVEL% NEQ 0 GOTO Error
	if %ERRORLEVEL% EQU 0 echo VLC has been successfully installed.

	:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	echo:
	echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

	GOTO Java

:Java

	@echo off
	echo:
	echo Installing Java Version 8.261.
	echo:

	if [%JavaInstallSilentData%] == [Enable] echo Silent install = Enabled
	if [%JavaInstallSilentData%] == [Disable] echo Silent install = Disabled

	if [%JavaRemoveOutOfDate%] == [1] echo Remove out of date versions = Enabled
	if [%JavaRemoveOutOfDate%] == [0] echo Remove out of date versions = Disabled

	:: "FilePath" INSTALL_SILENT=Enable/Disable REMOVEOUTOFDATEJRES=1/0
	%JavaInstallerLocation% INSTALL_SILENT=%JavaInstallSilentData% REMOVEOUTOFDATEJRES=%JavaRemoveOutOfDate%

	:: IF %ERRORLEVEL% NEQ 0 Echo An error was found
	:: IF %ERRORLEVEL% EQU 0 Echo No error found
	echo:
	if %ERRORLEVEL% NEQ 0 set FailedProgram=Java
	if %ERRORLEVEL% NEQ 0 GOTO Error
	if %ERRORLEVEL% EQU 0 echo Java has been successfully installed.

	:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	echo:
	echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

	GOTO Python

:Python

	@echo off
	echo:
	echo Installing Python 3.7.4.
	echo:

	if [%PythonAllUsers%] == [1] echo Install for all users = Enabled
	if [%PythonAllUsers%] == [0] echo Install for all users = Disabled

	if [%PythonInstallAndScriptsDirectories%] == [1] echo Add install and Scripts directories to PATH and .PY to PATHEXT = Enabled
	if [%PythonInstallAndScriptsDirectories%] == [0] echo Add install and Scripts directories to PATH and .PY to PATHEXT = Disabled

	if [%PythonTestScripts%] == [1] echo Install standard library test suite = Enabled
	if [%PythonTestScripts%] == [0] echo Install standard library test suite = Disabled

	:: "FilePath" InstallAllUsers=1/0 PrependPath=1/0 Include_test 1/0
	%PythonInstallerLocation% /quiet InstallAllUsers=%PythonAllUsers% PrependPath=%PythonInstallAndScriptsDirectories% Include_test=%PythonTestScripts%

	:: IF %ERRORLEVEL% NEQ 0 Echo An error was found
	:: IF %ERRORLEVEL% EQU 0 Echo No error found
	echo:
	if %ERRORLEVEL% NEQ 0 set FailedProgram=Python
	if %ERRORLEVEL% NEQ 0 GOTO Error
	if %ERRORLEVEL% EQU 0 echo Python has been successfully installed.

	:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	echo:
	echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

	GOTO Scratch

:Scratch

	@echo off
	echo:
	echo Installing Scratch.
	echo:

	if [%ScratchInstallAllUsers%] == [allusers] echo Install for all users = Enabled
	if [%ScratchInstallAllUsers%] == [] echo Install for all users = Disabled

	:: "FilePath" Silent Instal InstallAllUsers
	%ScratchInstallerLocation% /S %ScratchInstallAllUsers%
 
	:: IF %ERRORLEVEL% NEQ 0 Echo An error was found
	:: IF %ERRORLEVEL% EQU 0 Echo No error found
	echo:
	if %ERRORLEVEL% NEQ 0 set FailedProgram=Scratch
	if %ERRORLEVEL% NEQ 0 GOTO Error
	if %ERRORLEVEL% EQU 0 echo Scratch has been successfully installed
	
	:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	echo:
	echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	
:Kodu

	@echo off
	echo:
	echo Installing Kodu. This prompt will automatically close itself after installation.
	@echo off
	echo:
	echo Older versions of Kodu will be automatically uninstalled
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

	:: IF %ERRORLEVEL% NEQ 0 Echo An error was found
	:: IF %ERRORLEVEL% EQU 0 Echo No error found
	echo:
	if %ERRORLEVEL% NEQ 0 set FailedProgram=Kodu
	if %ERRORLEVEL% NEQ 0 GOTO Error
	if %ERRORLEVEL% EQU 0 echo Kodu has been successfully installed
	if %ERRORLEVEL% EQU 0 GOTO Finish

:Error

	echo(
    echo %FailedProgram% has failed to install
	pause
	exit
	:: pausing will allow the user to read the message and press a key to close
	
:Finish

	echo:
	echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	echo:
	echo All programs have been successfully installed. 
	echo This prompt will automatically close in 20 seconds.
	timeout /t 20
	exit
	:: Closes the script and Command Prompt.