
#check if appmode = 1  
# Get UserName and PWord from user PROMP
        write ''
        Write-Host -ForegroundColor Blue 'Login to Domain POSPROD'
        $domain = 'posprod\'
        write ''
        $User = Read-Host -Prompt 'UserName'
        $PWord = Read-Host -Prompt 'Password' -AsSecureString
        $domainUser = $domain+$user
        $Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $domainUser, $PWord
        

#$kupa = Read-Host 'kupa'

# Path to your text file
$txtPath = "C:\Users\itayda\Desktop\2.txt"

# Read the text file
$txtData = Get-Content -Path $txtPath



foreach ($l in $txtData) {
write $l
# Determine OS architecture
$osInfo = Get-WmiObject -ComputerName $l -Class Win32_OperatingSystem 
#write $osInfo.OSArchitecture

Write-Host "Checking OS architecture..."

if ($osInfo.OSArchitecture -eq "64-bit") {
    Write-Host "64-bit OS detected."
   $path = "C:\Program Files (x86)\Retalix\SCO.NET\App\ClientConfig.xml"
   Invoke-Command -ComputerName $l -Credential $Credential -ScriptBlock {

Write-Host -ForegroundColor Yellow $l
## Get XML SOURCE 
$xmldata = [XML](Get-Content ("C:\Program Files (x86)\Retalix\SCO.NET\App\ClientConfig.xml"))
## Set Xml Key

$elementValue = $xmldata.configuration.Shell.AppMode

write $elementValue

if ($elementValue -eq "1"){
    


$xmldata.configuration.SelfScan.SelfScanMode ="" 
Write-Host -ForegroundColor Green 'Change Button'
$xmldata.configuration.Shell.AppMode ="0"
Write-Host -ForegroundColor Green 'Change Appmode to 0'

## Save Xml 
$xmldata.Save("C:\Program Files (x86)\Retalix\SCO.NET\App\ClientConfig.xml") 
## LogOff Kupa 
Write-Host -ForegroundColor Green "LogOff $($kupa)"
(Get-WmiObject -Class Win32_OperatingSystem).Win32Shutdown(4)
Exit 0




}}
   } 
 else {
    Write-Host "32-bit OS detected."
    $path = "C:\Program Files\Retalix\SCO.NET\App\ClientConfig.xml"

    Invoke-Command -ComputerName $l -Credential $Credential -ScriptBlock {

Write-Host -ForegroundColor Yellow $l
## Get XML SOURCE 
$xmldata = [XML](Get-Content ("C:\Program Files\Retalix\SCO.NET\App\ClientConfig.xml"))
## Set Xml Key

$elementValue = $xmldata.configuration.Shell.AppMode

write $elementValue

if ($elementValue -eq "1"){
    


$xmldata.configuration.SelfScan.SelfScanMode ="" 
Write-Host -ForegroundColor Green 'Change Button'
$xmldata.configuration.Shell.AppMode ="0"
Write-Host -ForegroundColor Green 'Change Appmode to 0'

## Save Xml 
$xmldata.Save("C:\Program Files\Retalix\SCO.NET\App\ClientConfig.xml") 
## LogOff Kupa 
Write-Host -ForegroundColor Green "LogOff $($kupa)"
(Get-WmiObject -Class Win32_OperatingSystem).Win32Shutdown(4)
Exit 0




}
  
}





}

} 

pause