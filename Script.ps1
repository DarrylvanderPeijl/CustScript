<# Custom Script for Windows to install a file from Azure Storage using the staging folder created by the deployment script #>
param (
    [string]$Scriptlocation,
    [string]$folderName,
    [string]$fileToInstall
)

$source = $Scriptlocation + "\$folderName\$fileToInstall"
$dest = "C:\Perftest\$folderName"
New-Item -Path $dest -ItemType directory
Invoke-WebRequest $source -OutFile "$dest\$fileToInstall"