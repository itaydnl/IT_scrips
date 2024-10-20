write-Host ----------------------------------------------------
write-Host -ForegroundColor Green 'White Screen IVANTI Relese'
write-Host ----------------------------------------------------
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

# Get Computer Name WL\PL 
 $targetServer = Read-Host -Prompt 'enter WLpossrv or PLpossrv of the SNIFF '

#get Computer that Has WHITE SCREEN 
 $targetComputer = Read-Host -Prompt 'Enter the Computer with the Problem' 

#Stop Services on the server 
Invoke-Command -ComputerName $targetServer -Credential $Credential -ScriptBlock {gsv  *LANDES* | Stop-Service -Verbose}

#Restart The Problematic PC 
 $chiose =Read-Host -Prompt 'reset the PC? (0\1) '
    if ($chiose -eq 1){

                        $sure =Read-Host -Prompt 'Are You Sure? (0\1)' 
                         if ($sure -eq 1){                  
                                           Restart-Computer -ComputerName $targetComputer -Force 
                                            write 'Pc Restarted' 
                                          }
                      } 
                          else { write 'PC NOT Restarted '}

#Ping the PC 
ping $targetComputer -t 