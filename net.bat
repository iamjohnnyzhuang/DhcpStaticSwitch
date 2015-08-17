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
netsh interface ip set address "Wi-Fi" static 192.168.1.17 255.255.255.0 192.168.1.251 1 
netsh interface ipv4 set dns "Wi-Fi" static 8.8.8.8
netsh interface ipv4 set dns "Wi-Fi" 8.8.4.4 index=2
netsh int ip show config
pause 
goto end

:B 
@ECHO OFF 
ECHO Resetting IP Address and Subnet Mask For DHCP 
netsh int ip set address name = "Wi-Fi" source = dhcp
netsh interface ipv4 set dns "Wi-Fi" dhcp

ipconfig /renew

ECHO Here are the new settings for %computername%: 
netsh int ip show config

pause 
goto end 
:end