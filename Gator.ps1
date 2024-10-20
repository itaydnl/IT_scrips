$domain = "posprod.supersol.co.il"
$password = "qwer1234!" | ConvertTo-SecureString -asPlainText -Force
$username = "$domain\idoh"
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
$csv =  '$csv'
do
{
 clear
  
Write-Host
"
  Navi
	  </////////>
				  Gator
						     By_iD0H
" 




Write-Host '
1 - WKS
2 - NTS
3 - SLS
4 - LCD  
5 - ONL
6 - Unlock AD user
7 - PosProd Shell
8 - Restart Service in ONL 
9 - RDP
10- Restart PatrolAgent-WLPOSSRV 
11- ONL_Auto log Dis 0
12- ONL_Auto log En  1
13- Fix UAC in ONL
14- Change User Password 

'
$prompt = Read-Host -Prompt 'NAVIGATE_'

$onl = 'ONL'
$lcd = 'LCD'
$sls = 'SLS'
$Nts = 'NTS'
$wks = 'WKS'
$dash = '-'

$https = 'https://'
$portIndexHTML = ':4343/index.html'


if ($prompt -eq 1 )
 {
 $SnifNumber = Read-Host -Prompt 'SnifNumber'
 $DeviceNumber = Read-Host -Prompt 'WKS Number'

 $WksHostName = $wks + $dash + $SnifNumber + $dash + $DeviceNumber 
 
 $IPWksNumber = Resolve-DnsName $WksHostName | select -Property ipaddress | Export-Csv $csv

 $CsvFile = Import-Csv $csv

 $htmlIvanti = $https + $CsvFile.IPAddress + $portIndexHTML

    foreach ($ip in $CsvFile)
    {
      ping $WksHostName -n 2
    Start-Process chrome $htmlIvanti 
    }

}
 elseif ($prompt -eq 2)
 {
 $SnifNumber = Read-Host -Prompt 'SnifNumber'
 $DeviceNumber = Read-Host -Prompt 'NTS Number'

 $ntsHostName = $Nts + $dash + $SnifNumber + $dash + $DeviceNumber

 $IPntsNumber = Resolve-DnsName $ntsHostName | select -Property ipaddress | Export-Csv $csv

 $CsvFile = Import-Csv $csv

  $htmlIvanti = $https + $CsvFile.IPAddress + $portIndexHTML

   foreach ($ip in $CsvFile)
    {
     ping $ntsHostName -n 2
   
    Start-Process chrome $htmlIvanti 
    }
   }

   elseif ($prompt -eq 3)
   {
 $SnifNumber = Read-Host -Prompt 'SnifNumber'
 $DeviceNumber = Read-Host -Prompt 'SLS Number'

 $ntsHostName = $sls + $dash + $SnifNumber + $dash + $DeviceNumber

 $IPntsNumber = Resolve-DnsName $ntsHostName | select -Property ipaddress | Export-Csv $csv

 $CsvFile = Import-Csv $csv

  $htmlIvanti = $https + $CsvFile.IPAddress + $portIndexHTML

   foreach ($ip in $CsvFile)
    {
     ping $ntsHostName -n 2
   
    Start-Process chrome $htmlIvanti 
    }
   }
   elseif ($prompt -eq 4)

    {
 $SnifNumber = Read-Host -Prompt 'SnifNumber'
 $DeviceNumber = Read-Host -Prompt 'LCD Number'

 $ntsHostName = $lcd + $dash + $SnifNumber + $dash + $DeviceNumber

 $IPntsNumber = Resolve-DnsName $ntsHostName | select -Property ipaddress | Export-Csv $csv

 $CsvFile = Import-Csv $csv

  $htmlIvanti = $https + $CsvFile.IPAddress + $portIndexHTML

   foreach ($ip in $CsvFile)
    {
     ping $ntsHostName -n 2
   
    Start-Process chrome $htmlIvanti 
    }
   }

   elseif ($prompt -eq 5)
   {
   $ONLNumber = Read-Host -Prompt 'ONL Number'
   
   $onlHostname = $onl + $dash + $ONLNumber 
   $onlIp = Resolve-DnsName $onlHostname | select -Property ipaddress | Export-Csv $csv

   $CsvFile = Import-Csv $csv
   $htmlIvanti = $https + $CsvFile.IPAddress + $portIndexHTML
   foreach ($ip in $CsvFile)
   
    {
     ping $onlHostname -n 2
   
    Start-Process chrome $htmlIvanti 
    }
   

   }

   elseif($prompt -eq 6)
   {
   Unlock-ADAccount 
   }

   elseif($prompt -eq 7)
   {
    start "C:\Users\itayda\Desktop\PWS.cmd"
   start-sleep -seconds 10
  }

  elseif ($prompt -eq 8)
  {
  $onl = 'onl'
  $onlNumber = Read-Host "Enter Onl Number"
  $onlHostname = $onl + $dash + $ONLNumber
  Invoke-Command -ComputerName $onlHostname -ScriptBlock {Restart-Service shufersal* -PassThru -Force } -Credential $credential -ErrorAction SilentlyContinue
  Restart-Computer $onlHostname -Force -Credential $credential
  ping $onlHostname -n 7

  }

  elseif ($prompt -eq 9)
  {
  $hostname = read-Host 'Hostname'
 
   ping $onlHostname -n 2

   mstsc /v:$hostname

  
  }

  elseif ($prompt -eq 10)
  {
  $snifnumber = Read-Host 'SnifNumber'
  $wlpos = 'wlpossrv'
  $wlpossrv = $wlpos + $SnifNumber

  Invoke-Command -Credential $credential  -ComputerName $wlpossrv -ScriptBlock {Get-Service patrola* | Start-Service -PassThru -ErrorAction Stop }
  
  pause
   
  }

  elseif ($prompt -eq 11)
  {
  
  $Number = Read-Host 'Onl Number'
    $Hostname = 'onl-' + $Number

Invoke-Command -Credential $credential -ComputerName $Hostname  -ScriptBlock {

Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\' -Name "Autoadminlogon" -Value 0 -PassThru
pause 
  }
  }
  elseif ($prompt -eq 12 )
  {
  $Number = Read-Host 'Onl Number'
    $Hostname = 'onl-' + $Number
  Invoke-Command -Credential $credential -ComputerName $Hostname  -ScriptBlock {

  Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\' -Name "Autoadminlogon" -Value 1 -PassThru
    pause 
    }
  }
  elseif ($prompt -eq 13 )
  {
  $Number = Read-Host 'Onl Number'
  $onl = 'onl-'
  $hostname = $onl + $Number
  Invoke-Command -ComputerName $hostname -Credential $credential -ScriptBlock {
    Set-Itemproperty -path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\policies\system' -Name 'EnableLUA' -value 1 -PassThru -Verbose
     start-sleep -Seconds 5 
     

    }
    Restart-Computer -ComputerName $hostname -Force
	
  }
 elseif ($prompt -eq 14)
   {

   $password = "abc123456+"
   $newpassword = ConvertTo-SecureString -String $password -AsPlainText -force
   $username = Read-Host "Username" 

   Set-ADAccountPassword -Identity $username -NewPassword $newpassword -Reset
   Set-ADUser -Identity $username -ChangePasswordAtLogon $true
   echo "Passwrord Has been set to abc123456+ The user will need to reset his password next logon " 
   Start-Sleep -Seconds 5 
   }



  cls
} 

 
 
until (1 -eq 2)