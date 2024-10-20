@echo off
setlocal

:loop
set /p pcname="Enter hostname or IP address (or type 'exit' to quit): "
if /i "%pcname%"=="exit" goto end

set temp_vbs=%temp%\temp.vbs

echo Set WshShell = WScript.CreateObject("WScript.Shell") > %temp_vbs%
echo WshShell.Run "chrome.exe https://%pcname%:4343", 9, false >> %temp_vbs%
cscript //nologo %temp_vbs%
del %temp_vbs%

echo Press any key to continue...
pause > nul
goto loop

:end
endlocal
exit