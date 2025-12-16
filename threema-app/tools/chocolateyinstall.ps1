$ErrorActionPreference = 'Stop'
$url64 = 'https://releases.threema.ch/desktop/latest/threema-desktop-latest-windows-x64.msix'
$checksum64 = '4E12CABAC2697DBAEC98BB64B96DB9C88A5A671D43A0130896AF214B8148CD1B'

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