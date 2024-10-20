$domain = "posprod.supersol.co.il"
$password = "add123456++" | ConvertTo-SecureString -asPlainText -Force
$username = "$domain\itayda"
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
clear


do 
{
$target = Read-Host 'wlpossrv?'


Invoke-Command -ComputerName wlpossrv$target -Credential $credential -ScriptBlock {
Clear-Host

$ErrorActionPreference = "Stop"

$Folders = @(
    "D:\sdmcache",
    "D:\IvantIShare\drivers",
    "C:\Program Files (x86)\Landesk\ldclient\sdmcache",
    "C:\Program Files\Landesk\ldclient\sdmcache",
    "D:\supersol"
)

Foreach ($Folder in $Folders) {
    Write-Host -ForegroundColor Yellow "Deleting Folder $Folder on $env:computername"
    Get-ChildItem -Path $Folder -Recurse -Verbose | Remove-Item -Recurse -Force -Verbose
}

# Delete empty folders and subfolders
foreach ($Folder in $Folders) {
    Get-ChildItem $Folder -Directory -Verbose `
        | Where-Object { $_.FullName -in $Folders } `
        | ForEach-Object {
            Get-ChildItem $_.FullName -Directory -Verbose `
                | Sort-Object { $_.FullName.Length } -Descending `
                | Where-Object { $_.GetFiles().Count -eq 0 } `
                | ForEach-Object {
                    if ($_.GetDirectories().Count -eq 0) { 
                        Write-Host "Removing $($_.FullName)"
                        $_.Delete()
                    }
                }
        }
}

$ExcludeFolder = "D:\supersol"

Foreach ($Folder in $Folders) {
    if ($Folder -ne $ExcludeFolder) {
        Write-Host -ForegroundColor Green "Creating Directory $Folder on $env:computername"
        New-Item -ItemType Directory -Path $Folder -Force
    } else {
        Write-Host -ForegroundColor Yellow "Skipping directory $Folder on $env:computername"
    }
}
}


}
until (1 -eq 2 )