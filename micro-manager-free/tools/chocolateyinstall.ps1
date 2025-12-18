$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://getcoldturkey.com/files/Cold_Turkey_Micromanager_Free_Installer.exe'
$url64      = 'https://getcoldturkey.com/files/Cold_Turkey_Micromanager_Free_Installer.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'micro-manager-free*'

  checksum      = '550691F5EE2D1EE8F30299C0E0602FBC4BEF42DA2F2B7AD1F7A2C77E5AB9B538'
  checksumType  = 'sha256'
  checksum64    = '550691F5EE2D1EE8F30299C0E0602FBC4BEF42DA2F2B7AD1F7A2C77E5AB9B538'
  checksumType64= 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /LOG="C:\temp\install.log"'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs