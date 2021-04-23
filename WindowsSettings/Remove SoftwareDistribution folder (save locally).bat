@echo off
goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
		Echo.
		Echo You are running as an administrator!
        GOTO StopWindowsServices
    ) else (
	echo.
	echo =====================================================
	echo This script needs to be executed as an administrator.
	echo =====================================================
	echo.
	PAUSE
    GOTO EOF
    )

    pause >nul

:StopWindowsServices
	Echo.
	Echo.
	Echo =====================================================
	Echo Stopping Windows Services, this may take a while.
	Echo =====================================================
	Echo.
	
	@Echo off
	net stop wuauserv
	net stop cryptSvc
	net stop bits
	net stop msiserver

	Echo =====================================================================================
	echo Deleting files from "C:\Windows\SoftwareDistribution", this will take a minute or two.
	Echo =====================================================================================
	@echo off
	del "C:\Windows\SoftwareDistribution" /s /q

	@ECHO Off
	Echo.
	Echo.
	Echo.
	Echo.
	Echo =====================================================
	SET /P yesno=Do you want to Reboot this machine? [Y/N]:
	Echo =====================================================

	IF "%yesno%"=="y" GOTO RebootSystem
	IF "%yesno%"=="Y" GOTO RebootSystem
	IF "%yesno%"=="n" GOTO StartWindowsServices
	IF "%yesno%"=="N" GOTO StartWindowsServices
    
:RebootSystem
	ECHO System is going to Reboot now
    
	shutdown.exe /r 
		
	GOTO EOF

:StartWindowsServices
	Echo.
	net start wuauserv
	net start cryptSvc
	net start bits
	net start msiserver
		
	echo All services have been restarted
	PAUSE

:EOF
exit