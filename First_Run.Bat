@echo off
setlocal EnableDelayedExpansion

:: Change to the script's directory
set "ScriptDirectoryMantella=%~dp0"
set "ScriptDirectoryMantella=%ScriptDirectoryMantella:~0,-1%"
pushd "%ScriptDirectoryMantella%"

:: Check for administrative privileges
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo Error: Admin Required!
    echo Right Click, then Run As Administrator.
    timeout /t 3 >nul
    goto :eof
)
echo Admin Status: Administrator 

:: Display Is Reset
cls
echo ========================================================================================================================
echo                                                         Mantella
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo Working Folder: %ScriptDirectoryMantella%
timeout /t 1 >nul

:: Find Config
if exist ".\config.ini" (
    set "mantella_version=v11.4"
    echo Mantella is version ^<^=11.4
    echo.
    timeout /t 2 >nul
) else if exist "%USERPROFILE%\Documents\My Games\Mantella\config.ini" (
    set "mantella_version=v12"
    echo Mantella is version ^=^>12
    echo.
    timeout /t 2 >nul
) else (
    echo File Missing: config.ini	
)

:: First run check and requirement installation
echo Installing Requirements, Ensure Python Version ~3.11...
timeout /t 2 >nul
pip install -r requirements.txt
if errorlevel 1 (
    echo Failed to install requirements. Check Python and pip installation.
    goto end_of_file
)
echo ..Requirements Installed ^(Hopefully^).
echo.
timeout /t 2 >nul

:: After Requirements.
if "%mantella_version%"=="v11.4" (
    echo After First_Run Exits, Then Run Launcher.Bat.
    timeout /t 1 >nul
    echo Exit Sequence In 10 Seconds...
    timeout /t 10 >nul
    goto end_of_file
) else if "%mantella_version%"=="v12" (
    echo Instruction: Exit Mantella After "Waiting for player to select an NPC...", Then Run Launcher.Bat.
    timeout /t 1 >nul
    echo Running Mantella In 10 Seconds...
    timeout /t 10 >nul
    echo Running Mantella...
    timeout /t 1 >nul
    python .\main.py
    if errorlevel 1 (
        echo Error occurred while running Mantella.
        goto end_of_file
    )
    echo Mantella Exited.
    timeout /t 2 >nul    
)

:end_of_file
:: Exit Program
echo Closing in 5 seconds...
timeout /t 5 >nul
exit /b
