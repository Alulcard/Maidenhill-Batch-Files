:: Run this .bat file to silently install Python 3.7.4.
:: This file will install Python version 3.7.4.
:: Requires elevation in order to install. 
:: Running this file will cause CMD to appear on the screen and a UAC prompt
:: https://docs.python.org/3/using/windows.html
:: Written by Callum Wellard 02/03/2020

:: Change these variables to alter the installation of Python
@echo off
set AllUsers=1
:: Boolean
set InstallAndScriptsDirectories=1
:: Boolean
set TestScripts=0
:: Boolean
set InstallerLocation=Z:\SOFTWARE\Python\"python-3.7.4"
:: Install location (Case and slash sensitive)

echo:
echo:
echo Installing Python 3.7.4. This prompt will automatically close itself after installation.
echo:

if [%AllUsers%] == [1] echo Install for all users = Enabled
if [%AllUsers%] == [0] echo Install for all users = Disabled

if [%InstallAndScriptsDirectories%] == [1] echo Add install and Scripts directories to PATH and .PY to PATHEXT = Enabled
if [%InstallAndScriptsDirectories%] == [0] echo Add install and Scripts directories to PATH and .PY to PATHEXT = Disabled

if [%TestScripts%] == [1] echo Install standard library test suite = Enabled
if [%TestScripts%] == [0] echo Install standard library test suite = Disabled

echo:
echo Please click "Run" if prompted.

%InstallerLocation% /quiet InstallAllUsers=%AllUsers% PrependPath=%InstallAndScriptsDirectories% Include_test=%TestScripts%
:: "FilePath" InstallAllUsers=1/0 PrependPath=1/0 Include_test 1/0

if %ERRORLEVEL% NEQ 0 set FailedProgram=Python
if %ERRORLEVEL% NEQ 0 GOTO error
if %ERRORLEVEL% EQU 0 echo Python has been successfully installed.
if %ERRORLEVEL% EQU 0 GOTO exit

:error

	echo(
    echo Python has failed to install correctly.
	pause
	GOTO exit
	:: pausing will allow the user to read the message and press a key to close
	
:exit
:: Closes the script and Command Prompt. (automatic if Python is installed correctly)
