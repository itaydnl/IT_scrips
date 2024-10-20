 $csvHolder = 0
 
 $domain = "posprod.supersol.co.il"
 $password = "add123456++" | ConvertTo-SecureString -asPlainText -Force
 $username = "$domain\itayda"
 $credential = New-Object System.Management.Automation.PSCredential($username,$password)
 $csvFileLocation = "\\fileserv01\data\GROUPS\HelpDesk\jack\kuku.csv" 


do
{

Write-Host -ForegroundColor green
'		
	Wks -- 1 
	Nts -- 2 
	sls -- 3
	LCD -- 4  
	ONL -- 5 
'
$prompt = Read-Host -Prompt ' '

$onl = 'onl'
$lcd = 'lcd'
$sls = 'sls'
$Nts = 'nts'
$wks = 'wks'
$dash = '-'

$https = 'https://'
$portIndexHTML = ':4343/index.html'


if ($prompt -eq 1 )
 {
 $SnifNumber = Read-Host -Prompt 'SnifNumber'
 $DeviceNumber = Read-Host -Prompt 'WKS Number'

 $WksHostName = $wks + $dash + $SnifNumber + $dash + $DeviceNumber 
 
 $IPWksNumber = Resolve-DnsName $WksHostName | select -Property ipaddress | Export-Csv \\FILESERV01\Data\GROUPS\HelpDesk\jack\Remotecontrol.csv

 $CsvFile = Import-Csv \\FILESERV01\Data\GROUPS\HelpDesk\jack\Remotecontrol.csv

 $htmlIvanti = $https + $CsvFile.IPAddress + $portIndexHTML

    foreach ($ip in $CsvFile)
    {
      ping $WksHostName -n 2
    Start-Process chrome $htmlIvanti 
    }
	cls
}
 elseif ($prompt -eq 2)
 {
 $SnifNumber = Read-Host -Prompt 'SnifNumber'
 $DeviceNumber = Read-Host -Prompt 'NTS Number'

 $ntsHostName = $Nts + $dash + $SnifNumber + $dash + $DeviceNumber

 $IPntsNumber = Resolve-DnsName $ntsHostName | select -Property ipaddress | Export-Csv \\FILESERV01\Data\GROUPS\HelpDesk\jack\Remotecontrol.csv

 $CsvFile = Import-Csv \\FILESERV01\Data\GROUPS\HelpDesk\jack\Remotecontrol.csv

  $htmlIvanti = $https + $CsvFile.IPAddress + $portIndexHTML

   foreach ($ip in $CsvFile)
    {
     ping $ntsHostName -n 2
   
    Start-Process chrome $htmlIvanti 
	cls
    }
   }

   elseif ($prompt -eq 3)
   {
 $SnifNumber = Read-Host -Prompt 'SnifNumber'
 $DeviceNumber = Read-Host -Prompt 'SLS Number'

 $ntsHostName = $sls + $dash + $SnifNumber + $dash + $DeviceNumber

 $IPntsNumber = Resolve-DnsName $ntsHostName | select -Property ipaddress | Export-Csv \\FILESERV01\Data\GROUPS\HelpDesk\jack\Remotecontrol.csv

 $CsvFile = Import-Csv \\FILESERV01\Data\GROUPS\HelpDesk\jack\Remotecontrol.csv

  $htmlIvanti = $https + $CsvFile.IPAddress + $portIndexHTML

   foreach ($ip in $CsvFile)
    {
     ping $ntsHostName -n 2
   
    Start-Process chrome $htmlIvanti 
	cls
    }
   }
   elseif ($prompt -eq 4)

    {
 $SnifNumber = Read-Host -Prompt 'SnifNumber'
 $DeviceNumber = Read-Host -Prompt 'LCD Number'

 $ntsHostName = $lcd + $dash + $SnifNumber + $dash + $DeviceNumber

 $IPntsNumber = Resolve-DnsName $ntsHostName | select -Property ipaddress | Export-Csv \\FILESERV01\Data\GROUPS\HelpDesk\jack\Remotecontrol.csv

 $CsvFile = Import-Csv \\FILESERV01\Data\GROUPS\HelpDesk\jack\Remotecontrol.csv

  $htmlIvanti = $https + $CsvFile.IPAddress + $portIndexHTML

   foreach ($ip in $CsvFile)
    {
     ping $ntsHostName -n 2
   
    Start-Process chrome $htmlIvanti 
	cls
    }
   }

   elseif ($prompt -eq 5)
   {
   $ONLNumber = Read-Host -Prompt 'ONL Number'
   
   $onlHostname = $onl + $dash + $ONLNumber 
   $onlIp = Resolve-DnsName $onlHostname | select -Property ipaddress | Export-Csv \\FILESERV01\Data\GROUPS\HelpDesk\jack\Remotecontrol.csv

   $CsvFile = Import-Csv \\FILESERV01\Data\GROUPS\HelpDesk\jack\Remotecontrol.csv
   $htmlIvanti = $https + $CsvFile.IPAddress + $portIndexHTML
   foreach ($ip in $CsvFile)
   
    {
     ping $onlHostname -n 2
   
    Start-Process chrome $htmlIvanti 
	cls
    }
   

   }
	
	
	elseif ($prompt -eq 6)
	{
		start C:\Users\itayda\Desktop\PWS.cmd
		cls
		
    }
	elseif ($prompt -eq 7)
	{
		start 
		cls
		
    }
	
	elseif ($prompt -eq 0)
   {
    cls
    }

} 
 

until (1 -eq 2)