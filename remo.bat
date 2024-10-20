@echo off
@setlocal enableextensions enabledelayedexpansion

MODE 80,210
:start
cls
echo.
echo.
echo                               ____                                   
echo                        _wr""        "-q__                             
echo                     _dP                 9m_     
echo                   _#P                     9#_                         
echo                  d#@                       9#m                        
echo                 d##                         ###                       
echo                J###                         ###L                      
echo                {###K                       J###K                      
echo                ]####K      ___aaa___      J####F                      
echo            __gmM######_  w#P""   ""9#m  _d#####Mmw__                  
echo         _g######BLYAT###mZ_         __g######SUKKA###m_               
echo       _d####M@PPPP@@M#######Mmp gm#########@@PPP9@M####m_             
echo      a###""          ,Z"#####@" '######"\g          ""M##m            
echo     J#@"             0L  "*##     ##@"  J#              *#K           
echo     #"               `#    "_iTayDa_~    dF               `#_          
echo    7F                 "#_   ]#####F   _dK                 JE          
echo    ]                    *m__ ##### __g@"                   F          
echo    w                      "PJ#####LP"                      w           
echo     `                       0######_                      '           
echo       e                    _0########_                  3                 
echo         .               _d#####^#####m__              ,              
echo          "*w_________am#####P"   ~9#####mw_________w*"                  
echo              ""9@#####@M""           ""P@#####@M""                    
echo.
echo.

set /p _snif=Snif-
echo :.
if "%_snif%"=="" goto :start
If "%_snif%"=="x" goto :end
If "%_snif%"=="0" goto :start
Set s1=%_snif:~0,1%
Set s2=%_snif:~1,2%
set s3=%_snif:~2,3%
set s4=%_snif:~0,3%
dsquery computer -o rdn domainroot -name pos-%_snif%* > C:\SnifTools\computers.txt
echo("%_snif:"= %"|findstr /rbe /c:"""[0-9][0-9][0-9]""" >nul || ( cls & echo Snif number MUST BE 3 DIGITS & pause & goto start )
for /f "delims== tokens=1,2" %%G in  (C:\SnifTools\computers.txt)  do echo %%G

:Bhira
set /p _pc=Kupa:
If %_snif:~1,1% ==0 goto :choice
if "%_pc%"=="t" goto :pingallkuputbsnif
set p1=%_pc:~0,3%
set p2=%_pc:~1,2%
set n1=10
set /a new=n1 + p1
If "%_pc%"=="0" goto :start
If %_pc% LEQ 1 goto:kupa
If %_pc% GEQ 99 goto:pccontrol
If %_pc% GEQ 41 goto:kupasco
if "%_pc%"=="" goto :start
:kupa
start " " "C:\Program Files (x86)\IT Remote Control\vncviewer.exe" 10.1%s1%.%s2%.%new% /password "QWErty123$^" /64colors
start ping 10.1%s1%.%s2%.%new% -t
echo Pida Ras
set /p _stop1=Kill? :
If "%_stop1%"=="p" goto :pingkupa
If "%_stop1%"=="y" goto :killkupa
If "%_stop1%"=="n" goto :end
If "%_stop1%"=="0" goto :start
:killkupa

echo.
echo                            _.--""--._
echo                           /  _    _  \
echo                        _  ( (_\  /_) )  _
echo                       { \._\   /\   /_./ }
echo                       /_"=-.}______{.-="_\
echo                        _  _.=("""")=._  _
echo                       (_'"_.-"`~~`"-._"'_)
echo                        {_"            "_}


taskkill /s 10.1%s1%.%s2%.%new% /f /im grocerywinpos.exe
taskkill /s 10.1%s1%.%s2%.%new% /f /im agvania.exe


timeout /t 5
echo DEAD
set /p _onkupa=Start?:
If "%_onkupa%"=="y" goto :kupago
If "%_onkupa%"=="n" goto :end
If "%_onkupa%"=="0" goto :start
:kupago
psexec -i -s -d \\10.1%s1%.%s2%.%new% c:\retalix\wingpos\agvania.exe
echo Pida Ras

echo         _  _
echo   ___ (~ )( ~)
echo  /   \_\ \/ /
echo ן   D_ ]\ \/
echo ן   D _]/\ \
echo  \___/ / /\ \
echo      (_~)(_~)

set /p _exitkupa=0 / N:
If "%_exitkupa%"=="y" goto :start
If "%_exitkupa%"=="n" goto :end
If "%_exitkupa%"=="0" goto :start
:kupasco
start " " "C:\Program Files (x86)\IT Remote Control\vncviewer.exe" 10.1%s1%.%s2%.%new% /password "QWErty123$^" /64colors

set /p _stop3=Kill?? :
If "%_stop3%"=="p" goto :pingkupa
If "%_stop3%"=="y" goto :killkupasco
If "%_stop3%"=="n" goto :end
If "%_stop3%"=="0" goto :start
:killkupasco
taskkill /s 10.1%s1%.%s2%.%new% /f /im java.exe
taskkill /s 10.1%s1%.%s2%.%new% /f /im start_SCO.exe
echo KILLLLLLLLL!!!!!!
timeout /t 5
echo You Motherfucker!!! 
set /p _onkupasco=Start?? XXX:
If "%_onkupasco%"=="y" goto :kupascogo
If "%_onkupasco%"=="n" goto :end
If "%_onkupasco%"=="0" goto :start
:kupascogo
psexec -i -s -d  \\10.1%s1%.%s2%.%new% "C:\Program Files\Retalix\Start_Sco.exe"
echo Piderilla !!!
echo 0/N...
set /p _exitkupasco=0 / N :
If "%_exitkupasco%"=="y" goto :start
If "%_exitkupasco%"=="n" goto :end
If "%_exitkupasco%"=="0" goto :start



set /p _pc=Kupa:
:choice
if "%_pc%"=="t" goto :pingallkuputbsnif
set p1=%_pc:~0,3%
set n1=10
set /a new=n1 + p1
If "%_pc%"=="0" goto :start
If %_pc% LEQ 1 goto:kupa2
If %_pc% GEQ 99 goto:pccontrol
If %_pc% GEQ 41 goto:kupasco2
if "%_pc%"=="" goto :start
if "%_pc%"=="t" goto :pingallkuputbsnif
:kupa2
start " " "C:\Program Files (x86)\IT Remote Control\vncviewer.exe" 10.1%s1%.%s3%.%new% /password "QWErty123$^" /64colors
start ping 10.1%s1%.%s3%.%new% -t

set /p _stop2=Kill? :
If "%_stop2%"=="p" goto :pingkupa2
If "%_stop2%"=="y" goto :kupaend2
If "%_stop2%"=="n" goto :end
If "%_stop2%"=="0" goto :start
:kupaend2
taskkill /s 10.1%s1%.%s3%.%new% /f /im grocerywinpos.exe
taskkill /s 10.1%s1%.%s3%.%new% /f /im agvania.exe
echo PASHOL NAHOI
timeout /t 5
echo Blyat!
set /p _onkupa2=Start? XXX:
If "%_onkupa2%"=="y" goto :kupago2
If "%_onkupa2%"=="n" goto :end
If "%_onkupa2%"=="0" goto :start
:kupago2
psexec -i -s -d \\10.1%s1%.%s3%.%new% c:\retalix\wingpos\agvania.exe
echo 0 / N :
set /p _exitkupa2=0 / N :
If "%_exitkupa2%"=="y" goto :start
If "%_exitkupa2%"=="n" goto :end
If "%_exitkupa2%"=="0" goto :start
:kupasco2
start " " "C:\Program Files (x86)\IT Remote Control\vncviewer.exe" 10.1%s1%.%s3%.%new% /password "QWErty123$^" /64colors
echo Pida Ras...
set /p _stop4=Kill?? :
If "%_stop4%"=="p" goto :pingkupa2
If "%_stop4%"=="y" goto :killkupasco2
If "%_stop4%"=="n" goto :end
If "%_stop4%"=="0" goto :start
:killkupasco2
taskkill /s 10.1%s1%.%s3%.%new% /f /im java.exe
taskkill /s 10.1%s1%.%s3%.%new% /f /im start_SCO.exe
echo (.) (.)
timeout /t 5
echo :)
set /p _onkupasco2=Start?? XXX:
If "%_onkupasco2%"=="y" goto :kupascogo2
If "%_onkupasco%2"=="n" goto :end
If "%_onkupasco%2"=="0" goto :start
:kupascogo2
psexec -i -s -d  \\10.1%s1%.%s3%.%new% "C:\Program Files\Retalix\Start_Sco.exe"
echo PASHOL NAHOI
echo Blyat!
set /p _exitkupasco=0 / N :
If "%_exitkupasco%"=="y" goto :start
If "%_exitkupasco%"=="n" goto :end
If "%_exitkupasco%"=="0" goto :start
:pingkupa
cls
start ping 10.1%s1%.%s2%.%new% -t
goto :start
:pingkupa2
cls
start ping 10.1%s1%.%s3%.%new% -t
goto :start
:pccontrol
start " " "C:\Program Files (x86)\CA\DSM\Bin\gui_rcLaunch.exe" VIEW /N wks-%s4%-%p1% /A wks-%s4%-%p1% /L
echo To Open Printer of correct computer Type - 1:

set /p _patrol=echo Pida Ras:
If "%_patrol%"=="p" goto :pcping
If "%_patrol%"=="0" goto :start
If "%_patrol%"=="1" goto :printer
:pcping
cls
start ping wks-%s4%-%p1% -t
goto :start
:printer
If %_snif:~1,1% ==0 goto :printer2
cls
start iexplore.exe http://10.11%s1%.%s2%.2%p2%
start ping 10.11%s1%.%s2%.2%p2% -t
goto :start
:printer2
cls
start iexplore.exe http://10.11%s1%.%s3%.2%p2%
start ping 10.11%s1%.%s3%.2%p2% -t
goto :start

:pingallkuputbsnif 
break>C:\SnifTools\activePing.txt
break>C:\SnifTools\downping.txt
For /F "Usebackq Delims=" %%p in (
    C:\SnifTools\computers.txt
) do (
    Echo+
    Echo [+] Pinging: %%p
ping -n 1 %%p | find "TTL="
    ping -n 1 %%p | find "TTL=" 1>nul && (
        ECHO %%p >> C:\SnifTools\activePing.txt) || (
        ECHO %%p >> C:\SnifTools\downPing.txt)
)
echo.
echo Online Kuput
echo.
for /f "delims== tokens=1,2" %%O in  (C:\SnifTools\activePing.txt)  do echo %%O
echo.
echo Disconnected Kuput - NO PING
echo.
for /f "delims== tokens=1,2" %%K in  (C:\SnifTools\downPing.txt)  do echo %%K

goto :Bhira
:connectKuput
echo.
choice /c:10 /n /m "Want To Connect All Kuput in Snif ? ( 1 - Yes / 0- No )"
IF %ERRORLEVEL%==1 goto :yesconnect
IF %ERRORLEVEL%==2 goto :start

:yesconnect
For /F "Usebackq Delims=" %%U in (
    C:\SnifTools\activePing.txt
) do (
  start " " "C:\Program Files (x86)\IT Remote Control\vncviewer.exe" %%U /password "QWErty123$^" /64colors
)
set /p _benzema=....................
goto :start
