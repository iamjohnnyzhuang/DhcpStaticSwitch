@echo off 
echo Choose: 
echo [A] Set Static IP 
echo [B] Set DHCP 
echo. 
:choice 
SET /P C=[A,B]? 
for %%? in (A) do if /I "%C%"=="%%?" goto A 
for %%? in (B) do if /I "%C%"=="%%?" goto B 
goto choice 
:A 
@echo off 

echo "Setting Static IP Information" 
netsh interface ip set address "WLAN" static 10.8.149.230 255.255.248.0 10.8.144.51 1 
netsh interface ipv4 set dns "WLAN" static 192.168.50.89
netsh interface ip add dnsservers name="WLAN" address=192.168.50.88 index=2
netsh int ip show config
pause 
goto end

:B 
@ECHO OFF 
ECHO Resetting IP Address and Subnet Mask For DHCP 
netsh int ip set address name = "WLAN" source = dhcp
netsh interface ipv4 set dns "WLAN" dhcp

ipconfig /renew

ECHO Here are the new settings for %computername%: 
netsh int ip show config

pause 
goto end 
:end