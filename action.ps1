$Url = $args[0]
$AppToken = $args[1]
$Name = $args[2]
$Version = $args[3]
$Description = $args[4]

Install-Module -Name Microsoft.PowerShell.PSResourceGet -AllowPrerelease -Force -Scope CurrentUser 

$ErrorActionPreference = "Stop"
New-Item -Path /github/workspace/publish -ItemType Directory

New-ModuleManifest -Path /github/workspace/$name.psd1 -ModuleVersion $Version -Description $Description 
Compress-PSResource -Path /github/workspace -DestinationPath /github/workspace/publish/$Name.$Version.nupkg

Invoke-WebRequest -Uri $Url -Headers @{
    "Authorization" = "Bearer $AppToken"
} -InFile /github/workspace/publish/$Name.$Version.nupkg -Method Put -ContentType "application/octet-stream"