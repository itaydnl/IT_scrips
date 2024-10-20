@echo off
setlocal


:: Create a temporary script to run with elevated privileges
set "tempScript=%temp%\tempRegScript.cmd"
echo reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print" /v "TestRpcAuthnLevelPrivacyEnabled" /t REG_DWORD /d "0" /f > "%tempScript%"


:: Run the temporary script as administrator
runas /user:Administrator "%tempScript%"



endlocal

