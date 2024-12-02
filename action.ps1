$Url = $args[0]
$AppToken = $args[1]
$Name = $args[2]
$Version = $args[3]

New-ModuleManifest -Path /github/workspace/$name.psd1 -ModuleVersion $Version -Description "Description" 
Publish-PSResource -Path /github/workspace -DestinationPath ./publish/$Name.$Version.nupkg -Force

Invoke-WebRequest -Uri $Url -Headers @{
    "Authorization" = "Bearer $AppToken"
} -InFile ./publish/$Name.$Version.nupkg -Method Put -ContentType "application/octet-stream"