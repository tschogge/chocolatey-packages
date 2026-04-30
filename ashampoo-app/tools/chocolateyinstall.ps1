$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://cdn1.ashampoo.net/ashampoo/0401/ashampoo_app_2.16.1.exe'
$url64 = 'https://cdn1.ashampoo.net/ashampoo/0401/ashampoo_app_2.16.1.exe'
$checksum = '97DB2D19D32BF4535F8C32D1A21B7A90B4F9E28B25457B3A20C62F2D0D908DF5'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64

  softwareName   = 'ashampoo-app*'

  checksum       = $checksum
  checksumType   = 'sha256'
  checksum64     = $checksum
  checksumType64 = 'sha256'

  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /LOG=`"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).Install.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs