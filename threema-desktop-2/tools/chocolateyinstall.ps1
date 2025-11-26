$ErrorActionPreference = 'Stop'
$url64 = 'https://releases.threema.ch/desktop/latest/threema-desktop-latest-windows-x64.msix'
$checksum64 = '79B4ED7ED9996B813D9242F64A4900934267B00DFE6A90554ED8F97620D8A279'

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