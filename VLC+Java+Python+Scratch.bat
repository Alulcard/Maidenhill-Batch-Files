:: :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: ::
:: Run this .bat file to silently install VLC, Java, Python, and Scratch.                             ::
:: May require elevation in order to install.                                                         ::
:: Running this file will cause CMD to appear on the screen                                           ::
:: Removing old version of Java may cause an addition Command Prompt box to appear for a few seconds ::
:: Written by Callum Wellard 05/03/2020                                                               ::
:: :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: ::

@echo off
set VLCInstallerLocation=Z:\SOFTWARE\VLC\"vlc-3.0.8-win64"
set JavaInstallerLocation=Z:\SOFTWARE\Java\"jre-8u241-windows-x64"
set PythonInstallerLocation=Z:\SOFTWARE\Python\"python-3.7.4"
set ScratchInstallerLocation=Z:\SOFTWARE\Scratch\"Scratch Desktop Setup 3.6.0"

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
	echo This program will install VLC, Java, Python, and Scratch.
	echo This can take a few minutes. Please be patient.
	echo:
	echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

	GOTO VLC

:VLC

	echo:
	echo Installing VLC media player version 3.0.8.

	@echo off
	:: "FilePath" /L="languagecode" /S
	%VLCInstallerLocation% /L=%VLCLanguageOption% /S

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
	echo Installing Java Version 8.241.
	echo:

	if [%JavaInstallSilentData%] == [Enable] echo Silent install = Enabled
	if [%JavaInstallSilentData%] == [Disable] echo Silent install = Disabled

	if [%JavaRemoveOutOfDate%] == [1] echo Remove out of date versions = Enabled
	if [%JavaRemoveOutOfDate%] == [0] echo Remove out of date versions = Disabled

	:: "FilePath" INSTALL_SILENT=Enable/Disable REMOVEOUTOFDATEJRES=1/0
	%JavaInstallerLocation% INSTALL_SILENT=%JavaInstallSilentData% REMOVEOUTOFDATEJRES=%JavaRemoveOutOfDate%

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

	echo:
	echo Installing Scratch.
	echo:

	if [%ScratchInstallAllUsers%] == [allusers] echo Install for all users = Enabled
	if [%ScratchInstallAllUsers%] == [] echo Install for all users = Disabled

	:: "FilePath" Silent Instal InstallAllUsers
	%ScratchInstallerLocation% /S %ScratchInstallAllUsers%
 
	echo:
	if %ERRORLEVEL% NEQ 0 set FailedProgram=Scratch
	if %ERRORLEVEL% NEQ 0 GOTO Error
	if %ERRORLEVEL% EQU 0 GOTO echo Scratch has been successfully installed
	if %ERRORLEVEL% EQU 0 GOTO Finish

:Finish

	echo:
	echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	echo:
	echo All programs have been successfully installed. 
	echo This prompt will automatically close in 20 seconds.
	timeout /t 20000
	:: Closes the script and Command Prompt.

:Error

	echo(
    echo %FailedProgram% has failed to install
	pause
	GOTO EOF
	:: pausing will allow the user to read the message and press a key to close