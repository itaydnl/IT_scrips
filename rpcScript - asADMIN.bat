@echo off



reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print" /v "RpcAuthnLevelPrivacyEnabled" /t REG_DWORD /d "0" /f 





