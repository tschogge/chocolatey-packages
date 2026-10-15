$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://getcoldturkey.com/files/Cold_Turkey_Installer.exe?v=19Mar26'
$url64 = 'https://getcoldturkey.com/files/Cold_Turkey_Installer.exe?v=19Mar26'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64

  softwareName   = 'cold-turkey-blocker*'

  checksum       = 'BC28EBE4FCC506C7D06F9E2475C37D97'
  checksumType   = 'sha256'
  checksum64     = 'BC28EBE4FCC506C7D06F9E2475C37D97'
  checksumType64 = 'sha256'

  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /LOG="C:\temp\install.log"'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs