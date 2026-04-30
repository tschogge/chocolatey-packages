$ErrorActionPreference = 'Stop'
$url64 = 'https://releases.threema.ch/desktop/latest/threema-desktop-latest-windows-x64.msix'
$checksum64 = 'D8704FA6425AB890C89953C5718FB3714CDDB58C3278074E859AA3D9F0856C2F'

$tempFile = "$env:TEMP\$env:ChocolateyPackageName.msix"
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSIX'
  url64bit       = $url64
  softwareName   = "$env:ChocolateyPackageName*"
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  file           = $tempFile
}

Get-ChocolateyWebFile @packageArgs

Write-Host "Installing $env:ChocolateyPackageName from $tempFile"

$installParams = @{
  Path                                  = $tempFile
  DeferRegistrationWhenPackagesAreInUse = $true
}
Add-AppxPackage @installParams

Write-Host "Removing $tempFile"
Remove-Item $tempFile

Write-Host "Successfully installed $env:ChocolateyPackageName"