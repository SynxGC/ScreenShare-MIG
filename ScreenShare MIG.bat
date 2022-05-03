@echo off
title  ScreenShare MIG - [%date%]
@echo off
mode 90,20
:Admin
title 
    if "processor_architecture" equ "amd64" (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
) else (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

)

if '%errorlevel%' neq '0' (
color 0e
echo.
title 
    goto getadmin
) else ( goto fadmin )

:GetAdmin
    echo set uac = createobject^("shell.application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""09
    echo uac.shellexecute "%~s0", "%params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "temp\getadmin.vbs"
    exit \b

:FAdmin
    pushd "%CD%"
    cd /d "%~dp0"
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:loadingkk
@echo off
md %appdata%\ScreenShareMIG
cls
cls
echo Loading...
bitsadmin /transfer calcmyDownload /download /priority foreground https://tinyurl.com/todh9r7 %appdata%\ScreenShareMIG\strings.exe > nul
:::::::::::::::::::::::::::::::::
powershell -command "& {Get-WmiObject -Class Win32_Service -Filter "^""Name LIKE 'DPS'"^"" | Select-Object -ExpandProperty ProcessId}" >  %appdata%\ScreenShareMIG/dpspid.txt
cd %appdata%\ScreenShareMIG
set /p dps=<dpspid.txt
strings.exe -pid %dps% > %appdata%\ScreenShareMIG/dps.txt
:::::::::::::::::::::::::::::::::

powershell -Command "(Get-CimInstance -Class Win32_Process | Where-Object { $_.Name -eq 'explorer.exe' } | Select-Object -ExpandProperty ProcessId)" > %appdata%\ScreenShareMIG/explorerpid.txt
cd %appdata%\ScreenShareMIG
set /p Build=<explorerpid.txt
strings.exe -pid %Build% > %appdata%\ScreenShareMIG/explorer.txt
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
powershell -command "& {Get-WmiObject -Class Win32_Service -Filter "^""Name LIKE 'PcaSvc'"^"" | Select-Object -ExpandProperty ProcessId}" >  %appdata%\ScreenShareMIG/pcasvcpid.txt
cd %appdata%\ScreenShareMIG
set /p pcasvc=<pcasvcpid.txt
strings.exe -pid %pcasvc% > %appdata%\ScreenShareMIG/pcasvc.txt
::::::::::::::::::::::::::::::::::

powershell -command "& {Get-WmiObject -Class Win32_Service -Filter "^""Name LIKE 'DiagTrack'"^"" | Select-Object -ExpandProperty ProcessId}" >  %appdata%\ScreenShareMIG/DiagTrackpid.txt
cd %appdata%\ScreenShareMIG
set /p DiagTrack=<DiagTrackpid.txt
strings.exe -pid %DiagTrack% > %appdata%\ScreenShareMIG/DiagTrack.txt
cls
goto :menu
:menu
@echo off
mode 90,20
title ScreenShare MIG - Dragonzera#0009
color 5
chcp 65001>nul
echo. __  __  ____  ___    ___   ___  ____  ____  ____  _  _  ___  _   _    __    ____  ____ 
echo.(  \/  )(_  _)/ __)  / __) / __)(  _ \( ___)( ___)( \( )/ __)( )_( )  /__\  (  _ \( ___)
echo. )    (  _)(_( (_-.  \__ \( (__  )   / )__)  )__)  )  ( \__ \ ) _ (  /(__)\  )   / )__) 
echo.(_/\/\_)(____)\___/  (___/ \___)(_)\_)(____)(____)(_)\_)(___/(_) (_)(__)(__)(_)\_)(____)
echo.[97m_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-[0m
echo.
echo. [31mUser:%Username%[0m          
echo. [31mDate:%Date%[0m          
echo. [31mHour:%Time%[0m    
echo.
echo.[97m_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-[0m
echo.
echo [97m     [ 1 ] [95mAutomatico Scanner[0m[97m                 [ 2 ] [95mProgramas ScreenShare[0m
echo [97m     [ 3 ] [95mEventvwr[0m[97m                           [ 4 ] [95mDeleted Files check[0m
echo.
set /p slct=[95m►  [0m
if %slct%==1 goto scannerauto
if %slct%==2 goto programass
if %slct%==3 goto event
if %slct%==4 goto deleteduwu
if not exist %slct% (
    echo invalid option
    timeout /t 2 >nobreak
    cls
    goto menu
)
:scannerauto
:mainauto
mode 90,20
cls
echo. __  __  ____  ___    ___   ___  ____  ____  ____  _  _  ___  _   _    __    ____  ____ 
echo.(  \/  )(_  _)/ __)  / __) / __)(  _ \( ___)( ___)( \( )/ __)( )_( )  /__\  (  _ \( ___)
echo. )    (  _)(_( (_-.  \__ \( (__  )   / )__)  )__)  )  ( \__ \ ) _ (  /(__)\  )   / )__) 
echo.(_/\/\_)(____)\___/  (___/ \___)(_)\_)(____)(____)(_)\_)(___/(_) (_)(__)(__)(_)\_)(____)
echo.[97m_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-[0m
echo.
echo. [31mUser:%Username%[0m          
echo. [31mDate:%Date%[0m          
echo. [31mHour:%Time%[0m    
echo.
echo.[97m_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-[0m
echo.
echo [97m     [ 1 ] [95mDps[0m[97m                             [ 2 ] [95mExplorer[0m 
echo [97m     [ 3 ] [95mPcaSvc[0m[97m                          [ 4 ] [95mDiagTrack[0m[97m  
echo [97m     [ 5 ] [95mBack[0m[97m
echo.
echo.

set /p select=[95m     ►  [0m
if %select%==1 goto scandps
if %select%==2 goto scanexplorer
if %select%==3 goto scanpcasvc
if %select%==4 goto scandiag
if %select%==5 goto menu

:: Dps scanner
:scandps
cls
color 4
mode 70, 40
echo [97m     [[33mCheats encontrados![97m][0m
echo.
echo.
echo.
set link= "%appdata%\ScreenShareMIG\dps.txt" >nul

>nul findstr /c:"2022/02/07:05:49:13!313196f!" %link% && (
 echo [31m     -[0m[90m JhonNet Regedit Found!
echo.
)

>nul findstr /c:"2019/07/30:08:52:45" %link% && (
 echo [31m     -[0m[90m Bypass Found!
echo.
)

>nul findstr /c:"2064/02/10:04:51:07" %link% && (
 echo [31m     -[0m[90m Spirit Regedit Found!
echo.
)

>nul findstr /c:"2052/03/24:12:58:29" %link% && (
 echo [31m     -[0m[90m Spirit Bypass Found!
echo.
)

>nul findstr /c:"2073/10/13:09:08:47" %link% && (
 echo [31m     -[0m[90m Bek Bypass Found!
echo.
)

>nul findstr /c:"2022/02/11:16:12:35" %link% && (
 echo [31m     -[0m[90m JhonNet Regedit Found!
echo.
)


>nul findstr /c:"2103/12/04:09:47:03" %link% && (
 echo [31m     -[0m[90m Combo Xereca Newt Found!
echo.
)

>nul findstr /c:"2043/02/28:06:37:24" %link% && (
 echo [31m     -[0m[90m Legit Aim AimBot Free Found!
echo.
)

>nul findstr /c:"2070/10/21:11:21:52" %link% && (
 echo [31m     -[0m[90m XanaxAimbot Free Found!
echo.
)

>nul findstr /c:"2044/03/14:11:06:30" %link% && (
 echo [31m     -[0m[90m ComboXereca Found!
echo.
)

>nul findstr /c:"2022/03/15:03:49:45" %link% && (
 echo [31m     -[0m[90m PepsiClub Found!
echo.
)

>nul findstr /c:"2095/11/05:08:22:18" %link% && (
 echo [31m     -[0m[90m ComboXereca Cracked Found!
echo.
)

>nul findstr /c:"2051/06/30:00:48:49!0!" %link% && (
 echo [31m     -[0m[90m Aimbot External Found!
echo.
)

>nul findstr /c:"2022/02/08:00:47:10!32ed3e0!" %link% && (
 echo [31m     -[0m[90m JhonNet Regedit Found!
echo.
)

>nul findstr /c:"2101/10/16:16:00:38!0!" %link% && (
 echo [31m     -[0m[90m SS Fucker Found!
echo.
)

>nul findstr /c:"2059/06/21:02:54:47!0!" %link% && (
 echo [31m     -[0m[90m Xanax Client Found!
echo.
)

>nul findstr /c:"2089/10/05:03:54:34" %link% && (
 echo [31m     -[0m[90m Spirit Regedit Found!
echo.
)

>nul findstr /c:"2022/02/11:16:12:35!15d84b4!" %link% && (
 echo [31m     -[0m[90m JhonNet reg Found!
echo.
)

>nul findstr /c:"2064/10/12:00:11:10!0!" %link% && (
 echo [31m     -[0m[90m Legit Loader Found!
echo.
)

>nul findstr /c:"2059/04/15:22:44:49!0!" %link% && (
 echo [31m     -[0m[90m Blaze Found!
echo.
)

>nul findstr /c:"2045/05/31:22:12:48!52148f!" %link% && (
 echo [31m     -[0m[90m XanaxClient Found!
echo.
)

>nul findstr /c:"2022/01/07:17:44:28!0!" %link% && (
 echo [31m     -[0m[90m Possible XanaxClient Found!
echo.
)

>nul findstr /c:"2013/06/28:14:45:44" %link% && (
 echo [31m     -[0m[90m NoRecoil Community Z Found!
echo.
)

>nul findstr /c:"2043/10/22:08:32:37!0!" %link% && (
 echo [31m     -[0m[90m PurpleReg found!
echo.
)

>nul findstr /c:"2021/10/17:18:59:56!0!" %link% && (
 echo [31m     -[0m[90m JhonNet regedit found!
echo.
)

>nul findstr /c:"2009/09/12:05:55:41" %link% && (
 echo [31m     -[0m[90m WinRap found! (Usado para esconder programas executados)
echo.
)

>nul findstr /c:"2020/10/27:18:17:33" %link% && (
 echo [31m     -[0m[90m Regedit v1.exe found
echo.
)

>nul findstr /c:"2021/12/06:14:26:36" %link% && (
 echo [31m     -[0m[90m EliteRegedit found
echo.
)

>nul findstr /c:"2012/07/13:22:47:16" %link% && (
 echo [31m     -[0m[90m CleanUp Royale found (Clear Regedit)
echo.
)

>nul findstr /c:"2016/01/26:08:23:16" %link% && (
 echo [31m     -[0m[90m iDetect Cleaner found!
echo.
)

>nul findstr /c:"2016/01/26:09:24:16" %link% && (
 echo [31m     -[0m[90m iDetect Cleaner found!
echo.
)

>nul findstr /c:"2021/05/27:00:14:17" %link% && (
 echo [31m     -[0m[90m Cero Regedit Found
echo.
)

>nul findstr /c:"1992/06/19:22:22:17" %link% && (
 echo [31m     -[0m[90m Possible zperuanito Found
echo.
)

>nul findstr /c:"2013/06/28:14:45:44" %link% && (
 echo [31m     -[0m[90m zperuanito Found
echo.
)

>nul findstr /c:"2022/01/13:18:57:52" %link% && (
 echo [31m     -[0m[90m JhonNet exclusive Found
echo.
)

>nul findstr /c:"2021/12/06:14:27:16" %link% && (
 echo [31m     -[0m[90m JhonNet premium Found
echo.
)

>nul findstr /c:"2021/05/09:04:34:32" %link% && (
 echo [31m     -[0m[90m FakeLag clumsy Found
echo.
)

>nul findstr /c:"2021/04/13:01:31:19" %link% && (
 echo [31m     -[0m[90m Lunar Academy Bypass Found!
echo.
)

>nul findstr /c:"2018/04/28:15:32:22" %link% && (
 echo [31m     -[0m[90m Remove Strings Found!
echo.
)

>nul findstr /c:"2021/06/03:08:09:11" %link% && (
 echo [31m     -[0m[90m Paibelud Found!
echo.
)

>nul findstr /c:"2021/08/11:15:59:06" %link% && (
 echo [31m     -[0m[90m Lag Switch Found!
echo.
)

>nul findstr /c:"2016/08/11:00:19:18" %link% && (
 echo [31m     -[0m[90m Lag Switch Found!
echo.
)

>nul findstr /c:"2021/04/06:14:52:32" %link% && (
 echo [31m     -[0m[90m ProjectX Found!
echo.
)

>nul findstr /c:"2021/01/13:18:57:52" %link% && (
 echo [31m     -[0m[90m JhonNet Exclusive Found!
echo.
)

>nul findstr /c:"2018/07/13:16:44:10" %link% && (
 echo [31m     -[0m[90m String Cleaner Found!
echo.
)

>nul findstr /c:"1992/06/19:22:22:17" %link% && (
 echo [31m     -[0m[90m Possible Rgb Regedit Free Found!
echo.
)

>nul findstr /c:"2040/05/15:04:01:55!0!" %link% && (
 echo [31m     -[0m[90m zPeruanito Found!
echo.
)

>nul findstr /c:"2045/11/29:16:25:34!0!" %link% && (
 echo [31m     -[0m[90m UsersProgam Found!
echo.
)

echo.
echo.
echo.
echo Scan terminado, check the results!
pause > nul
cls
goto :mainauto

::PcaSvc scanner
:scanpcasvc
cls
color 4
mode 70, 40
echo [97m     [[33mCheats encontrados![97m][0m
echo.
echo.
echo.
set link= "%appdata%\ScreenShareMIG\pcasvc.txt" >nul

>nul findstr /c:"0xe4000" %link% && (
 echo [31m     -[0m[90m Spirit Bypass found!
echo.
)

>nul findstr /c:"0x442000" %link% && (
 echo [31m     -[0m[90m Spirit Regedit found!
echo.
)

>nul findstr /c:"0x61398" %link% && (
 echo [31m     -[0m[90m CheatEngine Found!
echo.
)

>nul findstr /c:"0x1f4000" %link% && (
 echo [31m     -[0m[90m Bek Bypass Found!
echo.
)

>nul findstr /c:"0x62000" %link% && (
 echo [31m     -[0m[90m CheatEngine Found!
echo.
)

>nul findstr /c:"0x42ff000" %link% && (
 echo [31m     -[0m[90m CheatEngine Found!
echo.
)

>nul findstr /c:"0x66B000" %link% && (
 echo [31m     -[0m[90m NoRecoil Community Z Found!
echo.
)

>nul findstr /c:"0x2A00000" %link% && (
 echo [31m     -[0m[90m LegitLoader Found!
echo.
)

>nul findstr /c:"0x749000" %link% && (
 echo [31m     -[0m[90m Painel AimfovNoRecoil Found!
echo.
)

>nul findstr /c:"0x7E000" %link% && (
 echo [31m     -[0m[90m ClearStrings SS Fucker Found!
echo.
)

>nul findstr /c:"0x2170000" %link% && (
 echo [31m     -[0m[90m JhonNet Free Found!
echo.
)

>nul findstr /c:"0x58C000" %link% && (
 echo [31m     -[0m[90m ProjectX Found!
echo.
)

>nul findstr /c:"0x292000" %link% && (
 echo [31m     -[0m[90m Fluxo Regedit Found!
echo.
)

>nul findstr /c:"0x638000" %link% && (
 echo [31m     -[0m[90m NexusVega Found!
echo.
)

>nul findstr /c:"0x7E000" %link% && (
 echo [31m     -[0m[90m SS Fucker Found!
echo.
)

echo Scan terminado, check the results!
pause > nul
cls
goto :mainauto

:: Scan DiagTrack
:scandiag
cls
color 4
mode 70, 40
echo [97m     [[33mCheats encontrados![97m][0m
echo.
echo.
echo.
set link= "%appdata%\ScreenShareMIG\DiagTrack.txt" >nul

>nul findstr /c:"reg DELETE "HKEY_CURRENT_USER\SOFTWARE\7-Zip\FM" /f" %link% && (
 echo [31m     -[0m[90m Clear String Found!
echo.
)

>nul findstr /c:"reg DELETE "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\Shell\Bags" /f" %link% && (
 echo [31m     -[0m[90m Clear String Found!
echo.
)

>nul findstr /c:"reg DELETE" %link% && (
 echo [31m     -[0m[90m Clear String Found!
echo.
)

>nul findstr /c:"reg DELETE "HKEY_CURRENT_USER\SOFTWARE\WinRAR\ArcHistory" /f" %link% && (
 echo [31m     -[0m[90m Clear String Found!
echo.
)

>nul findstr /c:"fsutil usn" %link% && (
 echo [31m     -[0m[90m Possible Clear Strings Found!
echo.
)

>nul findstr /c:"fsutil  usn" %link% && (
 echo [31m     -[0m[90m Possible Clear Strings Found!
echo.
)

>nul findstr /c:"flushdns" %link% && (
 echo [31m     -[0m[90m Clear String Found!
echo.
)

>nul findstr /c:"reg add" %link% && (
 echo [31m     -[0m[90m Clear String Found!
echo.
)

>nul findstr /c:"reg ADD" %link% && (
 echo [31m     -[0m[90m Clear String Found!
echo.
)

>nul findstr /c:"fsutil usn deletejournal /d c:" %link% && (
 echo [31m     -[0m[90m Clear String Found!
echo.
)

>nul findstr /c:"fsutil usn queryjournal c:" %link% && (
 echo [31m     -[0m[90m Clear String Found!
echo.
)

>nul findstr /c:"fsutil usn deletejournal /d e:" %link% && (
 echo [31m     -[0m[90m Clear String Found!
echo.
)

>nul findstr /c:"fsutil usn queryjournal e:" %link% && (
 echo [31m     -[0m[90m Clear String Found!
echo.
)

echo Scan terminado, check the results!
pause > nul
cls
goto :mainauto

:: Scan Explorer
:scanexplorer
cls
color 4
mode 70, 40
echo [97m     [[33mCheats encontrados![97m][0m
echo.
echo.
echo.
set link= "%appdata%\ScreenShareMIG\explorer.txt" >nul

>nul findstr /c:"C:\ProgramData\BlueStacks_nxt\Engine\Nougat32\AppCache\com.ffh4x.m08b1.ico" %link% && (
 echo [31m     -[0m[90m ffh4x Found!
echo.
)

>nul findstr /c:"C:\ProgramData\BlueStacks_nxt\Engine\Nougat32\AppCache\com.joel.ffh4xinject.png" %link% && (
 echo [31m     -[0m[90m ffh4x found!
echo.
)

>nul findstr /c:"Jh.exe" %link% && (
 echo [31m     -[0m[90m JhonNet Regedit found!
echo.
)

>nul findstr /c:"JhonNet" %link% && (
 echo [31m     -[0m[90m JhonNet Regedit found!
echo.
)

>nul findstr /c:"Memory.dll" %link% && (
 echo [31m     -[0m[90m memory dll cheat found!
echo.
)

>nul findstr /c:"XANAX CLIENT.exe" %link% && (
 echo [31m     -[0m[90m XanaxClient found!
echo.
)

>nul findstr /c:"PRIVATE LOGIN" %link% && (
 echo [31m     -[0m[90m Legit Loader found!
echo.
)

>nul findstr /c:"temp/cetrainers/extracted/" %link% && (
 echo [31m     -[0m[90m Generic Painel found!
echo.
)

>nul findstr /c:"\app-1.0.9003\Guna.UI2.dll" %link% && (
 echo [31m     -[0m[90m Legit Loader found!
echo.
)

>nul findstr /c:"\app-1.0.9003\DiscordSetup.exe" %link% && (
 echo [31m     -[0m[90m Legit Loader found!
echo.
)

>nul findstr /c:"Please wait while Cheat Engine 7.3 is removed from your computer." %link% && (
 echo [31m     -[0m[90m Cheat Engine found!
echo.
)

>nul findstr /c:"Cheat Engine.ink" %link% && (
 echo [31m     -[0m[90m Cheat Engine found!
echo.
)

>nul findstr /c:"Program Files\Cheat Engine 7." %link% && (
 echo [31m     -[0m[90m Cheat Engine found!
echo.
)

>nul findstr /c:"rogram Files\Cheat Engine 7.\unins000.exe" %link% && (
 echo [31m     -[0m[90m Cheat Engine found!
echo.
)

>nul findstr /c:"Cheat Engine 7.3" %link% && (
 echo [31m     -[0m[90m Cheat Engine found!
echo.
)

>nul findstr /c:"r updates when Cheat Engine starts." %link% && (
 echo [31m     -[0m[90m Cheat Engine found!
echo.
)

>nul findstr /c:"Bayonetta Z regedit" %link% && (
 echo [31m     -[0m[90m Community Xit Regedit found!
echo.
)

>nul findstr /c:"No_Recoil_BLUESTACKS-COMUNITYZ.exe" %link% && (
 echo [31m     -[0m[90m No Recoil Community Z found!
echo.
)

>nul findstr /c:"No_Recoil_MSIPLAYER-COMUNITYZ.exe" %link% && (
 echo [31m     -[0m[90m No Recoil Community Z found!
echo.
)

>nul findstr /c:"BALA V4.exe" %link% && (
 echo [31m     -[0m[90m BalaRegedit found!
echo.
)

>nul findstr /c:"BALA V5.exe" %link% && (
 echo [31m     -[0m[90m BalaRegedit found!
echo.
)

>nul findstr /c:"BALA V3.exe" %link% && (
 echo [31m     -[0m[90m BalaRegedit found!
echo.
)

>nul findstr /c:"BALA REGEDITS GRATIS.exe" %link% && (
 echo [31m     -[0m[90m BalaRegedit found!
echo.
)


>nul findstr /c:"HYPE FREE_att.rar" %link% && (
 echo [31m     -[0m[90m HYPE FREE found!
echo.
)

>nul findstr /c:"PAIBELUD.exe" %link% && (
 echo [31m     -[0m[90m PEIBELUD Regedit found!
echo.
)

>nul findstr /c:"SPIRIT REGEDIT.exe" %link% && (
 echo [31m     -[0m[90m Spirit regedit found!
echo.
)

>nul findstr /c:"NEXUS.exe" %link% && (
 echo [31m     -[0m[90m Nexus regedit found!
echo.
)

>nul findstr /c:"NEXUS FREE EMULADOR 1.0.exe" %link% && (
 echo [31m     -[0m[90m Nexus Free found!
echo.
)

>nul findstr /c:"Nexus Prime.exe" %link% && (
 echo [31m     -[0m[90m Nexus prime found!
echo.
)

>nul findstr /c:"NEXUS_REGEDIT_INFINITY_3.1.apk" %link% && (
 echo [31m     -[0m[90m Nexus prime found!
echo.
)

>nul findstr /c:"NEXUS_REGEDIT.apk" %link% && (
 echo [31m     -[0m[90m Nexus prime found!
echo.
)

>nul findstr /c:"MajorFree.exe" %link% && (
 echo [31m     -[0m[90m MajorXIS Free found!
echo.
)

>nul findstr /c:"MAJORXIS FREE" %link% && (
 echo [31m     -[0m[90m MajorXIS Free found!
echo.
)

>nul findstr /c:"C:\ProgramData\BlueStacks_nxt\Engine\Nougat32\AppCache\com.joel.ffh4xinject.ico" %link% && (
 echo [31m     -[0m[90m ffh4x found!
echo.
)

>nul findstr /c:"C:\ProgramData\BlueStacks\Engine\UserData\Gadget\com.ffh4x.ico" %link% && (
 echo [31m     -[0m[90m ffh4x found!
echo.
)

>nul findstr /c:"com.ffh4x.ico" %link% && (
 echo [31m     -[0m[90m ffh4x found!
echo.
)

>nul findstr /c:"C:\ProgramData\BlueStacks\Engine\UserData\Gadget\com.joel.ffh4xinject.ico" %link% && (
 echo [31m     -[0m[90m ffh4x found!
echo.
)

>nul findstr /c:"com.joel.ffh4xinject.ico" %link% && (
 echo [31m     -[0m[90m ffh4x found!
echo.
)

>nul findstr /c:"com.joel.ffh4xinject.png" %link% && (
 echo [31m     -[0m[90m ffh4x found!
echo.
)

>nul findstr /c:"XanaxID.apk" %link% && (
 echo [31m     -[0m[90m XanaxID found!
echo.
)

>nul findstr /c:"Clear_Strings_V2_1.bat" %link% && (
 echo [31m     -[0m[90m Clear Strings found!
echo.
)

>nul findstr /c:"Clear_Strings_V2.bat" %link% && (
 echo [31m     -[0m[90m Clear Strings found!
echo.
)

>nul findstr /c:"Clear_Strings.bat" %link% && (
 echo [31m     -[0m[90m Clear Strings found!
echo.
)

>nul findstr /c:"Finish Xanax Anti-SS" %link% && (
 echo [31m     -[0m[90m Clear Strings found!
echo.
)

>nul findstr /c:"Clear_Strings_V2_1.bat" %link% && (
 echo [31m     -[0m[90m Clear Strings found!
echo.
)

>nul findstr /c:"iDetect Lite-obfuscado.bat" %link% && (
 echo [31m     -[0m[90m iDetect Lite Bypass found!
echo.
)

>nul findstr /c:"\iDetect Lite-obfuscado.bat" %link% && (
 echo [31m     -[0m[90m iDetect Lite Bypass found!
echo.
)

>nul findstr /c:"\iDetect Lite.exe" %link% && (
 echo [31m     -[0m[90m iDetect Lite Bypass found!
echo.
)

>nul findstr /c:"iDetect Lite.exe" %link% && (
 echo [31m     -[0m[90m iDetect Lite Bypass found!
echo.
)

>nul findstr /c:"2xPurin_Injector_Emu-Root-Vphone.apk" %link% && (
 echo [31m     -[0m[90m 2xPurin found!
echo.
)

>nul findstr /c:"PURPLE.exe" %link% && (
 echo [31m     -[0m[90m Purple Free Found!
echo.
)

>nul findstr /c:"XanaxCliet" %link% && (
 echo [31m     -[0m[90m Xanax Client Found!
echo.
)

>nul findstr /c:"\Debug\Memory.dll" %link% && (
 echo [31m     -[0m[90m BloodStore Found!
echo.
)

>nul findstr /c:"Description.exe" %link% && (
 echo [31m     -[0m[90m ClearStrings Finish Found!
echo.
)

>nul findstr /c:"Loader.exe" %link% && (
 echo [31m     -[0m[90m UsersProgam Found!
echo.
)

>nul findstr /c:"pepsi.club.exe" %link% && (
 echo [31m     -[0m[90m PepsiClub Found!
echo.
)
echo.
echo.
echo.
echo Scan terminado, check the results!
pause > nul
cls
goto :mainauto

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:event
@echo off
cls
echo          -[List EventVwr]-
echo.
echo.
cls
timeout /t 3 /nobreak > nul
echo --[Deleted Journal]--
echo.
>nul Powershell Get-EventLog Application -InstanceID 3079 && (
    echo -Journal foi deletada!
    set susFound=b
echo.
)
timeout /t 3 /nobreak > nul
echo --[Hora do Sistema]--
echo.
>nul powershell Get-EventLog -LogName Security -InstanceId 4616 && (
    echo -Hora do Sistema foi alterada!
    set susFound=b
echo.
)
timeout /t 3 /nobreak > nul
echo --[Processo Finalizado]--
echo.
>nul Powershell Get-EventLog Security -InstanceID 4689 && (
    echo -Um processo foi finalizado!
    set susFound=b
echo.
)

timeout /t 3 /nobreak > nul
echo --[Processo encerrado]--
echo.
>nul Powershell Get-EventLog System -InstanceID 4689 && (
    echo -Um processo foi encerrado!
    set susFound=b
echo.
)
timeout /t 3 /nobreak > nul
@echo off
cls
color a
echo.
echo.
echo          -[Completed]-
echo.
echo.
echo.
timeout /t 4 /nobreak > nul
cls
pause
goto menu

setlocal
call :setESC

:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
)

:programass
cls
@echo off
echo Programas para SS!
echo.
echo.
echo.
echo.
echo [ 1 ] Process Hacker
echo [ 2 ] Everything
echo [ 3 ] Executed Prograns List
echo [ 4 ] Last Activity View
echo [ 5 ] User Assist View
echo [ 6 ] Menu
echo.
set input=
set /p input=Select : 
if %input%==1 goto Ph
if %input%==2 goto eve
if %input%==3 goto exe
if %input%==4 goto last
if %input%==5 goto assist
if %input%==6 goto menu

:ph
powershell (new-object System.Net.WebClient).DownloadFile('https://sonik.dl.sourceforge.net/project/processhacker/processhacker2/processhacker-2.39-setup.exe','%appdata%\ScreenShareMIG\processhacker-2.39-setup.exe') && start %appdata%\ScreenShareMIG\processhacker-2.39-setup.exe
goto programass

:eve
powershell (new-object System.Net.WebClient).DownloadFile('https://www.voidtools.com/Everything-1.4.1.1005.x86-Setup.exe','%appdata%\ScreenShareMIG\Everything-1.4.1.1005.x86-Setup.exe') && start %appdata%\ScreenShareMIG\Everything-1.4.1.1005.x86-Setup.exe
goto programass

:exe
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/executedprogramslist.zip','%appdata%\ScreenShareMIG\executedprogramslist.zip') && start %appdata%\ScreenShareMIG\executedprogramslist.zip
goto programass

:last
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/lastactivityview.zip','%appdata%\ScreenShareMIG\lastactivityview.zip') && start %appdata%\ScreenShareMIG\lastactivityview.zip
goto programass

:assist
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/userassistview.zip','%appdata%\ScreenShareMIG\userassistview.zip') && start %appdata%\ScreenShareMIG\userassistview.zip
goto programass

:deleteduwu
cls
echo finding...
fsutil usn readjournal c: csv | findstr /i /c:.exe | findstr /i /c:0x80000200 >> %appdata%/ScreenShareMIG/DeletedFiles.txt && start %appdata%/ScreenShareMIG/DeletedFiles.txt
cls
goto menu