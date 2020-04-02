:: :::::::::::: ::
:: RUN as admin ::
:: :::::::::::: ::

REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d 1 /f