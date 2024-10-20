write-Host ---------------------------------
write-Host -ForegroundColor Green 'Restart ISSUSER'
write-Host ---------------------------------
write-Host '' 
write-Host -ForegroundColor Yellow 'by iTayDa'
write-Host ''
# Get UserName and PWord from user PROMP
write ''
write 'the Domain is POSPROD'
$domain = 'posprod\'
write ''
$User = Read-Host -Prompt 'Enter UserName'
$PWord = Read-Host -Prompt 'Enter a Password' -AsSecureString
$domainUser = $domain+$user
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $domainUser, $PWord
write-Host ''


$targetComputer = Read-Host -Prompt 'enter Target Computer' 
Invoke-Command -ComputerName $targetComputer -Credential $Credential -ScriptBlock {
gsv  *ISSUSER* | Stop-Service -Force -Verbose
gsv  *ISSUSER* | Start-Service  -Verbose
}
write ''
write-host -ForegroundColor Green 'Done!'

pause
