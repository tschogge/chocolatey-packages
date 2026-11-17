$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://storage.googleapis.com/mistralai-ci-desktop-app/vibe-1.1.0-setup.exe'
$url64      = 'https://storage.googleapis.com/mistralai-ci-desktop-app/vibe-1.1.0-setup.exe'
$checksum   = 'D946312B91D95F495B7E50DE4E9072DE51D3CE0530034EBAA30DA4A167E391AA'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'vibe-desktop*'

  checksum      = $checksum
  checksumType  = 'sha256' 
  checksum64    = $checksum
  checksumType64= 'sha256' 

  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /LOG=`"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).Install.log`""
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs 