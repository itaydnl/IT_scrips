$a = Get-Credential 
$snif = Read-Host "Please enter snif number: "
gsv *LAND* -ComputerName wlpossrv$snif  |Stop-Service
pause
