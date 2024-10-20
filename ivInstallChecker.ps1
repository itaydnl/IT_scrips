$target = Read-Host -prompt 'set target' 

do {
gps -ComputerName $target  ONL*
gps -ComputerName $target  WKS*
 gps -ComputerName $target  NT*
 gps -ComputerName $target  Un*
 sleep 1 
 cls 
}
until (2 < 1)