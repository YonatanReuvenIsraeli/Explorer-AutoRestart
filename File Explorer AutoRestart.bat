@echo off
setlocal
title File Explorer AutoRestart
echo Program Name: File Explorer AutoRestart
echo Version: 1.0.0
echo Developer: @YonatanReuvenIsraeli
echo Website: https://www.yonatanreuvenisraeli.dev
echo License: GNU General Public License v3.0
net session > nul 2>&1
if not "%errorlevel%"=="0" goto "NotAdministrator"
goto "Start"

:"NotAdministrator"
echo.
echo Please run this batch file as an administrator. Press any key to close this batch file.
pause > nul 2>&1
goto "Close"

:"Start"
echo.
echo Cheching if "%windir%\explorer.exe" exist.
if not exist "%windir%\explorer.exe" goto "ExplorerNotExist"
echo "%windir%\explorer.exe" exists.
echo.
echo Press any key to auto-restart explorer.exe.
pause > nul 2>&1
echo Auto-restarting explorer.exe until batch file is closed.
goto "Explorer"

:"ExplorerNotExist"
echo "%windir%\explorer.exe" does not exist! Press any key to close this batch file.
pause > nul 2>&1
goto "Close"

:"Explorer"
tasklist | findstr /l explorer.exe > nul
if not "%errorlevel%"=="0" start explorer.exe
goto "Explorer"

:"Close"
endlocal
exit