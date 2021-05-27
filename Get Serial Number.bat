@echo off
echo PC name:
hostname
:: Gets the PC name for easier identification

Echo.
wmic bios get serialnumber
:: Gets the serial number from the BIOS

PAUSE
