$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://getcoldturkey.com/files/Cold_Turkey_Installer.exe?v=02Dec25'
$url64 = 'https://getcoldturkey.com/files/Cold_Turkey_Installer.exe?v=02Dec25'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64

  softwareName   = 'cold-turkey-blocker*'

  checksum       = '5975ADADC52C96E6B72AE0774D6FF9738F1935E92475B5415758C657A7E4843A'
  checksumType   = 'sha256'
  checksum64     = '5975ADADC52C96E6B72AE0774D6FF9738F1935E92475B5415758C657A7E4843A'
  checksumType64 = 'sha256'

  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /LOG="C:\temp\install.log"'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs