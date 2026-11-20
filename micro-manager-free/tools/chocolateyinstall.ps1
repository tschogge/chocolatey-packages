$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://getcoldturkey.com/files/Cold_Turkey_Micromanager_Free_Installer.exe'
$checksum64 = '4E4A6BA066CAF4E7F124451EDDE48D9B3138D3F6CC534C141D2773A5795432A4'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url64
  url64bit      = $url64

  softwareName  = 'micro-manager-free*'

  checksum      = $checksum64
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /LOG="C:\temp\install.log"'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs