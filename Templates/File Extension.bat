@echo off
Setlocal enabledelayedexpansion

Set "Pattern= "
:: What to replace
Set "Replace= "
:: What to replace with

:: Change file type to match files needed to change
For %%a in (*.FileType) Do (
    Set "File=%%~a"
    Ren "%%a" "!File:%Pattern%=%Replace%!"
)

Pause&Exit