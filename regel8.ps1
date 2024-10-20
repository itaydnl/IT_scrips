$domain = "posprod.supersol.co.il"
$password = "add123456++" | ConvertTo-SecureString -asPlainText -Force
$username = "$domain\itayda"
$credential = New-Object System.Management.Automation.PSCredential($username,$password)


Write-Host '---NetworkAdapterEnabler08---' -ForegroundColor green
$SNIFnumber = Read-Host 'Snifnumber'

ping wlpossrv$SNIFnumber -n 1 -l 420 
Get-NetAdapter -CimSession wlpossrv$SNIFnumber | where -Property Status -eq Disabled

#if (Get-NetAdapter -CimSession wlpossrv$SNIFnumber | where -Property Status -eq Disabled) {
 #   Invoke-Command -ComputerName wlpossrv$SNIFnumber -Credential $credential -ScriptBlock {
  #  Get-NetAdapter -CimSession wlpossrv$SNIFnumber | where -Property Status -eq Disabledc|Enable-NetAdapter
   #  }
#}

pause