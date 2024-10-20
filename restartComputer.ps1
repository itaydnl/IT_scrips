write-Host ---------------------------------
write-Host -ForegroundColor Green 'Restart Computer'
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
Restart-Computer -ComputerName $targetComputer  -Credential $Credential  -Force
write-host $targetComputer 'has Been Restarted by' $domainUser 
write '' 
ping $targetComputer -t 