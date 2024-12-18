$Url = $args[0]
$AppToken = $args[1]
$Name = $args[2]
$Version = $args[3]
$Description = $args[4]

Install-Module -Name Microsoft.PowerShell.PSResourceGet -AllowPrerelease -Force -Scope CurrentUser 

$ErrorActionPreference = "Stop"
New-Item -Path /github/workspace/publish -ItemType Directory

New-ModuleManifest -Path /github/workspace/$name.psd1 -ModuleVersion $Version -Description $Description 
$Package = Compress-PSResource -Path /github/workspace -DestinationPath /github/workspace/publish -PassThru

Invoke-WebRequest -Uri "$Url/api/v1/deployment" -Headers @{
    "Authorization" = "Bearer $AppToken"
} -InFile $Package -Method Put -ContentType "application/octet-stream"