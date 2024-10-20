@echo off
cd /d %~dp0

if not exist "c:\install\EdgifyAgent\" (
    md "c:\install\EdgifyAgent"
)

IF "%PROCESSOR_ARCHITECTURE%"=="x86" (GOTO x86) ELSE (GOTO x64)

:x64
taskkill /f /im "edgify-agent.exe" /t
xcopy /E /I /Y "\\10.250.236.25\IvantiShare\Packages\POS\-Edgify-\EdgifyAgent\Agent_v1.27\x64\EdgifyAgentMsi_1.27.0_x64.msi" "c:\install\EdgifyAgent\" 
cd /d c:\install\EdgifyAgent
echo "msi installing"
msiexec.exe /i "c:\install\EdgifyAgent\EdgifyAgentMsi_1.27.0_x64.msi" /L*V C:\edgify\UpgradeLog_v1.27-msi.log /passive ACCOUNT_TOKEN=... BASE_URL=https://edgify.corp.supersol.co.il/api/v1/edge WS_ENDPOINT=edgify.corp.supersol.co.il WS_PROTOCOL=wss WEB_GRPC_PORT=28080 WEB_SERVER_PORT=23000
echo "msi finished" 
rem xcopy /E /I /Y "\\10.250.236.25\IvantiShare\Packages\POS\-Edgify-\EdgifyAgent\Agent_v1.27\x64\account_token.txt" "C:\edgify\agent\shared\"
rem xcopy /E /I /Y "\\10.250.236.25\IvantiShare\Packages\POS\-Edgify-\EdgifyAgent\Agent_v1.27\x64\config.yaml" "C:\edgify\agent\"
goto :check_os

:x86
taskkill /f /im "edgify-agent.exe" /t
xcopy /E /I /Y "\\10.250.236.25\IvantiShare\Packages\POS\-Edgify-\EdgifyAgent\Agent_v1.27\x86\EdgifyAgentMsi_1.27.0_x32.msi" "c:\install\EdgifyAgent\" 
cd /d c:\install\EdgifyAgent
echo "msi installing"
msiexec.exe /i "c:\install\EdgifyAgent\EdgifyAgentMsi_1.27.0_x32.msi" /L*V C:\edgify\UpgradeLog_v1.27-msi.log /passive ACCOUNT_TOKEN=... BASE_URL=https://edgify.corp.supersol.co.il/api/v1/edge WS_ENDPOINT=edgify.corp.supersol.co.il WS_PROTOCOL=wss WEB_GRPC_PORT=28080 WEB_SERVER_PORT=23000
echo "msi finished" 
rem xcopy /E /I /Y "\\10.250.236.25\IvantiShare\Packages\POS\-Edgify-\EdgifyAgent\Agent_v1.27\x86\account_token.txt" "C:\edgify\agent\shared\"
rem xcopy /E /I /Y "\\10.250.236.25\IvantiShare\Packages\POS\-Edgify-\EdgifyAgent\Agent_v1.27\x86\config.yaml" "C:\edgify\agent\"
goto :check_os

:check_os
for /f "delims=" %%i in ('powershell -Command "(Get-WmiObject Win32_OperatingSystem).Caption"') do set "osname=%%i"
echo Detected OS: %osname%

:trim_osname
if "%osname:~-1%"==" " set "osname=%osname:~0,-1%"
echo Trimmed OS Name: %osname%

:decide_os
if "%osname:Microsoft Windows 10=%" neq "%osname%" (
	echo Executing Windows 10 specific commands
	taskkill /f /im "edgify-agent.exe" /t
    copy /y "\\10.250.236.25\IvantiShare\Packages\POS\-Edgify-\EdgifyAgent\Agent_v1.27\XmlU.exe" "C:\Program Files (x86)\Retalix\SCO.NET\App\"
    copy /y "\\10.250.236.25\IvantiShare\Packages\POS\-Edgify-\EdgifyAgent\Agent_v1.27\SCO_DevicesConfig_Edgify.xml" "C:\Program Files (x86)\Retalix\SCO.NET\App\"
	xcopy /E /I /Y "\\10.250.236.25\IvantiShare\Packages\POS\-Edgify-\EdgifyAgent\Agent_v1.27\x64\account_token.txt" "C:\edgify\agent\shared\"
	xcopy /E /I /Y "\\10.250.236.25\IvantiShare\Packages\POS\-Edgify-\EdgifyAgent\Agent_v1.27\x64\config.yaml" "C:\edgify\agent\"
    cd /d "C:\Program Files (x86)\Retalix\SCO.NET\App"
    xmlu  edit "C:\Program Files (x86)\Retalix\SCO.NET\App\DevicesConfig.xml" /REP:I /S:SCO_DevicesConfig_Edgify.xml
	timeout /t 15 >NUL 2>&1
	taskkill /f /im "edgify-agent.exe" /t
	sc start "EdgifyService"
) else (
    if "%osname:Windows 7=%" neq "%osname%" (
		echo Executing Windows 7 specific commands
		taskkill /f /im "edgify-agent.exe" /t
        copy /y "\\10.250.236.25\IvantiShare\Packages\POS\-Edgify-\EdgifyAgent\Agent_v1.27\XmlU.exe" "C:\Program Files\Retalix\SCO.NET\App\"
        copy /y "\\10.250.236.25\IvantiShare\Packages\POS\-Edgify-\EdgifyAgent\Agent_v1.27\SCO_DevicesConfig_Edgify.xml" "C:\Program Files\Retalix\SCO.NET\App\"
		xcopy /E /I /Y "\\10.250.236.25\IvantiShare\Packages\POS\-Edgify-\EdgifyAgent\Agent_v1.27\x86\account_token.txt" "C:\edgify\agent\shared\"
		xcopy /E /I /Y "\\10.250.236.25\IvantiShare\Packages\POS\-Edgify-\EdgifyAgent\Agent_v1.27\x86\config.yaml" "C:\edgify\agent\"
        cd /d "C:\Program Files\Retalix\SCO.NET\App"
        xmlu  edit "C:\Program Files\Retalix\SCO.NET\App\DevicesConfig.xml" /REP:I /S:SCO_DevicesConfig_Edgify.xml
		timeout /t 15 >NUL 2>&1
		taskkill /f /im "edgify-agent.exe" /t
		sc start "EdgifyService"
    ) else if "%osname:Windows Embedded=%" neq "%osname%" (
		echo Executing Windows Embedded specific commands
		taskkill /f /im "edgify-agent.exe" /t
        copy /y "\\10.250.236.25\IvantiShare\Packages\POS\-Edgify-\EdgifyAgent\Agent_v1.27\XmlU.exe" "C:\Program Files\Retalix\SCO.NET\App\"
        copy /y "\\10.250.236.25\IvantiShare\Packages\POS\-Edgify-\EdgifyAgent\Agent_v1.27\SCO_DevicesConfig_Edgify.xml" "C:\Program Files\Retalix\SCO.NET\App\"
		xcopy /E /I /Y "\\10.250.236.25\IvantiShare\Packages\POS\-Edgify-\EdgifyAgent\Agent_v1.27\x86\account_token.txt" "C:\edgify\agent\shared\"
		xcopy /E /I /Y "\\10.250.236.25\IvantiShare\Packages\POS\-Edgify-\EdgifyAgent\Agent_v1.27\x86\config.yaml" "C:\edgify\agent\"
        cd /d "C:\Program Files\Retalix\SCO.NET\App"
        xmlu  edit "C:\Program Files\Retalix\SCO.NET\App\DevicesConfig.xml" /REP:I /S:SCO_DevicesConfig_Edgify.xml
		timeout /t 15 >NUL 2>&1
		taskkill /f /im "edgify-agent.exe" /t
		sc start "EdgifyService"
    )
)

exit /b 0