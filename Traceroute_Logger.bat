@echo off

echo Traceroute_Logger.bat
echo Tool that uses traceroute when an internet outage is detected (no internet) against 8.8.8.8 (Google DNS), logging the results to a tracert.txt file.
echo It does a traceroute as well against the main router IP.


:bucle
ping google.com >nul 2>&1
if %errorlevel%==1 (goto nointernet) else (echo "Ping Worked - Internet Available")
echo %date% %time%
timeout 5 >nul 2>&1

goto bucle

:nointernet
echo "Error code 1: No internet detected"
echo %date% %time%

echo "-----------------------" >> pingToOurRouter.txt
echo %date% %time% >> pingToOurRouter.txt
tracert /d 192.168.0.1 >> pingToOurRouter.txt

echo "-----------------------" >> tracert.txt
echo %date% %time% >> tracert.txt
tracert /d 8.8.8.8 >> tracert.txt
timeout 5 >nul 2>&1
goto bucle
