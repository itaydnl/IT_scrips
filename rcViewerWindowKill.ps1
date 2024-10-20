write-Host ---------------------------------
write-Host -ForegroundColor Green 'Remote Control windows Remove'
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

# Get target Computer name 
$targetComputer = Read-Host -Prompt 'enter Target Computer' 

#Invoke the command on the target computer with the Credentials provided 

Invoke-Command -ComputerName $targetComputer -Credential $Credential -ScriptBlock {gps rcuser -Verbose | Stop-Process -Force -Verbose}
Write-Host -ForegroundColor Cyan 'Process Killed by' $domainUser 'on' $targetComputer 'Successfully'

pause
