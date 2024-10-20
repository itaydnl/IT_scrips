$https = 'https://'
$portIndexHTML = ':4343/index.html'
$numbero = 0
$addresio = 0
$tempo = "onl-"


write "*-$<..Ivanti_Xpress / iTayDa..>$-*"

while (1 -eq 1)
{
# Get ONL Number in <NUMBERIO> and Store it in <VARIO>:

    $numbero = Read-Host -Prompt 'onl- '	
        $vario = $tempo+$numbero
	
  
## Make Logical HTML Address Format in <ADDRESSIO>:	

    $addresio = Resolve-DnsName $vario |select -property ipaddress
        $html_format = 'https://' + $addresio.IPAddress + ':4343/index.html'

### Ping The ONL          
      
    ping -n 1 $addresio.IPAddress
	
#### Launch HTTP in CHROME 	
		 
    Start-Process firefox $html_format

#### Clean and Re-Start	   
cls
}
 






 