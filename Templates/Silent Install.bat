:: Run this .bat file to silently install ProgramName.
:: Running this file will cause CMD to appear on the screen and a UAC prompt
:: Installation parameters website link
:: Written by Callum Wellard ../../....

:: Change these variables to alter the installation of ProgramName
@echo off
set VariableName=Variable
:: Enable / Disable (Case sensitive)
set InstallerLocation="Z:\SOFTWARE\..."
:: Install location (Case and slash sensitive)

echo:
echo:
echo Installing ProgramName. This prompt will automatically close itself after installation.
echo:

if [%VariableName%] == [Enable] echo Variable = Enabled
if [%VariableName%] == [Disable] echo Variable = Disabled

echo:
echo Please click "Run" if prompted.

%InstallerLocation% EXEParameterName=%VariableName%
:: "FilePath" 

if %ERRORLEVEL% NEQ 0 set FailedProgram=ProgramName
if %ERRORLEVEL% NEQ 0 GOTO Error
if %ERRORLEVEL% EQU 0 echo ProgramName has been successfully installed.

:error

	echo(
    echo ProgramName has failed to install correctly.
	pause
	GOTO exit
	:: pausing will allow the user to read the message and press a key to close
	
:exit
:: Closes the script and Command Prompt. (automatic if ProgramName is installed correctly)