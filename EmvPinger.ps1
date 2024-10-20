##EMV Pinger

do {


$snif = Read-Host -Prompt 'snif '
 $kupa = Read-Host -Prompt 'kupa '
  $pos = [int]$kupa+10 
   $emv = [int]$kupa+150 

#Write-Host 'kupa ip is: ' $pos
#Write-Host 'emv ip end is ' $emv

#write $snif[0]
#write $snif[1]
#write $snif[2]

write '' 

    $posIp = '10.1'+$snif[0]+'.'+$snif[1]+$snif[2]+ '.' + $pos
    $posEmv = '10.1'+$snif[0]+'.'+$snif[1]+$snif[2]+ '.' + $emv

ping $posIp -n 1 
ping $posEmv -n 20   

cls
} 

until (1 -eq 2 )