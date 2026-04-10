@echo off
title HOME Network Setup

set eth=Ethernet

echo Switching to HOME network (DHCP)...

netsh interface ip set address name="%eth%" static 10.0.112.133 255.255.248.0 10.0.112.1
netsh interface ip set dns name="%eth%" static 1.1.1.1

echo.
echo HOME network enabled successfully.
pause