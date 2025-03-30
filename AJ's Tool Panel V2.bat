@echo off 
Title AJ's Tool Panel V2 ~ @glyphaj
setlocal enabledelayedexpansion

goto logo

:select
cls
title AJ's Panel V2 ^> %username%
CALL :AJSLOGO

echo.
echo  ----------------------
echo  [1] Webhook Message
echo  [2] Webhook Spammer
echo  [3] Join Server
echo  [4] Exit
echo  ----------------------
echo.

set /p "input=Choose an option: "
if "%input%"=="1" goto webhookone
if "%input%"=="2" goto webhookspam
if "%input%"=="3" goto server
if "%input%"=="4" exit /b
if %input%==ADMIN goto ADMIN
goto select

:webhookspam
title AJ's Panel V2 ^> Webhook Spammer [%username%]
color 06
cls
echo %username% you chose: Webhook Spammer
set /p "webhook=[>] Enter webhook URL: "
set /p "text=[>] Enter text to send to webhook: "
set /p "repeat=[>] How many times do you want to send the message? "

set "isNumber=1"
for /f "delims=0123456789" %%a in ("%repeat%") do (
    set "isNumber=0"
)

if !isNumber! == 0 (
    echo Invalid number. Please enter a valid number.
    pause
    goto webhookspam
)

set /a count=0

:webhook_loop_spam
title AJ's Panel V2 ^> Webhook Spammer [%username%]
if !count! LSS %repeat% (
    echo Sending "!text!" to webhook...

    curl -H "Content-Type: application/json" -X POST -d "{\"content\": \"!text!\"}" "!webhook!" >nul 2>&1

    set /a count+=1
    goto webhook_loop_spam
)

echo All messages sent!
pause
goto select

:webhookone
title title AJ's Panel V2 ^> Webhook Message Sender [%username%]
color 0c
cls
echo %username% you chose: Webhook Message Sender
set /p "webhook= [>] Enter webhook URL: "

:: Ask for the text to send to the webhook
set /p "text= [>] Enter text to send to webhook: "

:webhook_loop_one
:: Ask if the user wants to send the message
set /p "loop= [>] Would you like to send the message? (Y/N): "
set "loop=!loop:~0,1!"


if /i "!loop!"=="Y" (
    echo Sending "!text!" to webhook...

    curl -H "Content-Type: application/json" -X POST -d "{\"content\": \"!text!\"}" "!webhook!" >nul 2>&1

    echo Message sent!
    
    goto webhook_loop_one
) else (
    echo Message sending stopped.
    pause
    goto select
)

endlocal

:ADMIN
cls
title Admin Panel ~ @glyphaj
color 06
echo You Have Chosen: ADMIN
echo Welcome to the Admin Panel!
echo.
echo.
echo   [1] Join The Discord Server
echo   [2] [FEATURE NOT ADDED YET]
echo   [3] Go Back
echo.
set /p "input=Choose an option: "
if "%input%"=="1" goto server
if "%input%"=="2" goto ADMIN
if "%input%"=="3" goto select

:serveradmin
start chrome https://discord.gg/JKrmCHwKtE
cls
goto ADMIN

:server
start chrome https://discord.gg/JKrmCHwKtE
cls
goto select

:logo
cls
title AJ's Panel V2 ~ @glyphaj
chcp 65001 >nul
echo.
set /p username=[38;5;219m[+] Enter a username:
cls
echo [38;5;219mWelcome to AJ's panel %username%.
timeout /t 2 /nobreak >nul
title AJ's Panel V2 ^> %username%
cls
echo.
echo.
echo [38;5;214m █████╗      ██╗███████╗    ██████╗  █████╗ ███╗   ██╗███████╗██╗
echo [38;5;215m██╔══██╗     ██║██╔════╝    ██╔══██╗██╔══██╗████╗  ██║██╔════╝██║
echo [38;5;216m███████║     ██║███████╗    ██████╔╝███████║██╔██╗ ██║█████╗  ██║
echo [38;5;217m██╔══██║██   ██║╚════██║    ██╔═══╝ ██╔══██║██║╚██╗██║██╔══╝  ██║
echo [38;5;218m██║  ██║╚█████╔╝███████║    ██║     ██║  ██║██║ ╚████║███████╗███████╗
echo [38;5;219m╚═╝  ╚═╝ ╚════╝ ╚══════╝    ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝                                                         
echo [38;5;219m-- Made by @glyphaj
set /p yesorno=[38;5;219m[-] Would you like to proceed [Y/N]?
if /i "%yesorno%"=="Y" (
    goto select
) else (
    goto logoo
)
                                                                                            

:logoo
cls
chcp 65001 >nul
title AJ's Panel V2 ^> %username%
echo.
echo.
echo [38;5;214m █████╗      ██╗███████╗    ██████╗  █████╗ ███╗   ██╗███████╗██╗
echo [38;5;215m██╔══██╗     ██║██╔════╝    ██╔══██╗██╔══██╗████╗  ██║██╔════╝██║
echo [38;5;216m███████║     ██║███████╗    ██████╔╝███████║██╔██╗ ██║█████╗  ██║
echo [38;5;217m██╔══██║██   ██║╚════██║    ██╔═══╝ ██╔══██║██║╚██╗██║██╔══╝  ██║
echo [38;5;218m██║  ██║╚█████╔╝███████║    ██║     ██║  ██║██║ ╚████║███████╗███████╗
echo [38;5;219m╚═╝  ╚═╝ ╚════╝ ╚══════╝    ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝
echo [38;5;219m-- Made by @glyphaj
set /p yesorno=[38;5;219m[-] Would you like to proceed [Y/N]?
if /i "%yesorno%"=="Y" (
    goto select
) else (
    goto logoo
)

:AJSLOGO
cls
chcp 65001 >nul
echo.
echo.
echo [38;5;214m █████╗      ██╗███████╗    ██████╗  █████╗ ███╗   ██╗███████╗██╗
echo [38;5;215m██╔══██╗     ██║██╔════╝    ██╔══██╗██╔══██╗████╗  ██║██╔════╝██║
echo [38;5;216m███████║     ██║███████╗    ██████╔╝███████║██╔██╗ ██║█████╗  ██║
echo [38;5;217m██╔══██║██   ██║╚════██║    ██╔═══╝ ██╔══██║██║╚██╗██║██╔══╝  ██║
echo [38;5;218m██║  ██║╚█████╔╝███████║    ██║     ██║  ██║██║ ╚████║███████╗███████╗
echo [38;5;219m╚═╝  ╚═╝ ╚════╝ ╚══════╝    ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝
echo [38;5;219m-- Made by @glyphaj
