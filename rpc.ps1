write-Host ---------------------------------
write-Host -ForegroundColor Green 'RPC Enable on Remote Host Script'
write-Host ---------------------------------
write-Host '' 
write-Host -ForegroundColor Yellow 'by iTayDa'
write-Host '' 
# Get UserName and PWord from user PROMP




 

$domain = 'posprod\'
$User = Read-Host -Prompt 'Enter UserName'
$PWord = Read-Host -Prompt 'Enter a Password' -AsSecureString
$domainUser = $domain+$user
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $domainUser, $PWord
write-Host ''

# Get target Computer name 
$targetComputer = Read-Host -Prompt 'enter Target Computer' 

#Invoke the command on the target computer with the Credentials provided 

Invoke-Command -ComputerName $targetComputer -Credential $Credential -ScriptBlock {
 # Define the path to the registry key
 $registryPath = "HKLM:\System\CurrentControlSet\Control\Print"

 # Define the name and value of the registry entry
  $entryName = "RpcAuthnLevelPrivacyEnabled"
 # entryName = "TEST"
 $entryValue = 0  # DWORD value

 # Check if the registry key exists, if not, create it
 if (-not (Test-Path $registryPath)) {
     New-Item -Path $registryPath -Force
 }

 # Add the registry entry
 New-ItemProperty -Path $registryPath -Name $entryName -Value $entryValue -PropertyType DWord -Force

 write-Host "Registry key added successfully."
 write ''

 # restart Print-Spooler
 gsv spooler | Restart-Service -Force
 write-Host -ForegroundColor DarkGreen 'Spooler Restarted'
 gsv SAPSprint | Start-Service
 write-Host -ForegroundColor DarkGreen 'SAPSprint Started'
 gsv lpdsvc | Start-Service
 write-Host -ForegroundColor DarkGreen 'lpdsvc Started'
 }

 write-Host ''
 write-Host ''
 write-Host -ForegroundColor DarkGreen '========== Scripted' $targetComputer 'using' $domainUser 'Credentials ==========' 
 write-Host ''

 Pause