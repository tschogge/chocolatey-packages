$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://getcoldturkey.com/files/Cold_Turkey_Installer.exe?v=19Mar26'
$url64 = 'https://getcoldturkey.com/files/Cold_Turkey_Installer.exe?v=19Mar26'
$checksum64 = '4F3E78C62891210812DE608D445622073B0D8F3F046AE511F9F18D7297858C96'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64

  softwareName   = 'cold-turkey-blocker*'

  checksum       = $checksum64
  checksumType   = 'sha256'
  checksum64     = $checksum64
  checksumType64 = 'sha256'

  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /LOG="C:\temp\install.log"'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs