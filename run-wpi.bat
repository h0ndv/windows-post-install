@echo off
title Windows Post Install - Launcher
color 0A

echo ========================================
echo    Windows Post Install Launcher
echo ========================================
echo.
echo This script will run the Windows Post Install installer
echo with administrator privileges.
echo.
echo Verifying administrator privileges...
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Administrator privileges required
    echo.
    echo Requesting privilege elevation...
    echo.
    powershell.exe -Command "Start-Process powershell -ArgumentList '-ExecutionPolicy', 'Bypass', '-File', '%~dp0wpi.ps1' -Verb RunAs"
    echo.
    exit /b
)

echo Running with administrator privileges
echo.
echo Starting Windows Post Install...
echo.
powershell.exe -ExecutionPolicy Bypass -File "%~dp0wpi.ps1"

echo.
