$domain = "posprod.supersol.co.il"
$password = "qwer1234!" | ConvertTo-SecureString -asPlainText -Force
$username = "$domain\idoh"
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
clear


do 
{
$SNIFnumber = Read-Host 'Snifnumber'
$slpossrv = 'slpossrv'
$plpossrv = 'plpossrv'
$plpossrvFULL = $Plpossrv + $SNIFnumber
$SLPOSSRVFULL = $slpossrv + $SNIFnumber 
Invoke-Command -ComputerName $plpossrvFULL -Credential $credential -ScriptBlock {hostname
Get-Content D:\WINGPOS\Version.txt }
Invoke-Command -ComputerName $SLPOSSRVFULL -Credential $credential -ScriptBlock {hostname
Get-Content D:\WINGPOS\Version.txt -ErrorAction SilentlyContinue }
}
until (1 -eq 2 )