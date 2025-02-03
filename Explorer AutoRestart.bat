@echo off
setlocal
title Explorer AutoRestart
echo Program Name: Explorer AutoRestart
echo Version: 1.0.15
echo License: GNU General Public License v3.0
echo Developer: @YonatanReuvenIsraeli
echo GitHub: https://github.com/YonatanReuvenIsraeli
echo Sponsor: https://github.com/sponsors/YonatanReuvenIsraeli
"%windir%\System32\net.exe" user > nul 2>&1
if not "%errorlevel%"=="0" goto "InWindowsPreinstallationEnvironmentWindowsRecoveryEnvironment"
goto "Start"

:"InWindowsPreinstallationEnvironmentWindowsRecoveryEnvironment"
echo.
echo You are in Windows Preinstallation Environment or Windows Recovery Environment! You must run this batch file in Windows. Press any key to close this batch file.
pause > nul 2>&1
goto "Close"

:"Start"
echo.
echo Checking if "%windir%\explorer.exe" exist.
if not exist "%windir%\explorer.exe" goto "ExplorerNotExist"
echo "%windir%\explorer.exe" exists.
echo.
echo Press any key to auto-restart the process "explorer.exe" if it is stopped until this batch file is closed.
pause > nul 2>&1
cls
echo Auto-restarting the process "explorer.exe" if it is stopped until this batch file is closed.
goto "Explorer"

:"ExplorerNotExist"
echo "%windir%\explorer.exe" does not exist! Press any key to close this batch file.
pause > nul 2>&1
goto "Close"

:"Explorer"
"%windir%\System32\tasklist.exe" | find /i "explorer.exe" > nul 2>&1
if not "%errorlevel%"=="0" "%windir%\explorer.exe"
goto "Explorer"

:"Close"
endlocal
exit
