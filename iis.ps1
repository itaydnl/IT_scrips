



do
{


 $Snif_Number = Read-Host -Prompt "Enter the snif number " 


 write-host "to reset iis on both PLPOSSRV SLPOSSRV press 1" 
 Write-Host "to reset iis on PLPOSSRV press 2 "
 Write-Host  "to reset iis on SLPOSSRV press 3 " 
 Write-Host "to exit the script press 0"
 # start  iexplore "http://plpossrv$Snif_Number.posprod.supersol.co.il:4444/wsgpos/service.asmx/TestWS"
 #  start  iexplore "http://slpossrv$Snif_Number.posprod.supersol.co.il:4444/wsgpos/service.asmx/TestWS"     
#username
 
 $domain = "posprod.supersol.co.il"
 $password = "qwer1234!" | ConvertTo-SecureString -asPlainText -Force
 $username = "$domain\idoh"
 $credential = New-Object System.Management.Automation.PSCredential($username,$password)

 #veriables For sl and pl 
 $PLPOSSRV_SLPOSSRV = New-PSSession -ComputerName plpossrv$Snif_Number, slpossrv$Snif_Number -Credential $credential 
 #veriable fo PL 
 $plpossrv = New-PSSession -ComputerName plpossrv$Snif_Number -Credential $credential 
 #veriable for sl 
 $slpossrv = New-PSSession -ComputerName slpossrv$Snif_Number -Credential $credential

 #start  iexplore "http://plpossrv$Snif_Number.posprod.supersol.co.il:4444/wsgpos/service.asmx/TestWS"
 #start  iexplore "http://slpossrv$Snif_Number.posprod.supersol.co.il:4444/wsgpos/service.asmx/TestWS" 

 $prompt = Read-Host -Prompt "Enter a number  "

 if ($prompt -eq 1)
 { 
  Invoke-Command -Session $PLPOSSRV_SLPOSSRV -ScriptBlock {iisreset}
 }
 elseif ($prompt -eq 2)
 {
 Invoke-Command -Session $plpossrv -ScriptBlock {iisreset} 
 }

 elseif ($Prompt -eq 3 )
 {
 Invoke-Command -Session $slpossrv -ScriptBlock {iisreset}
 }

}



until (1 -eq 2)
#while ($prompt -eq 0  ) 


pause



