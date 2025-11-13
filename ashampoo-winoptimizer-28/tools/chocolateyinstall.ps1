$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.ashampoo.com/ashampoo_winoptimizer_28.exe'
$url64 = 'https://www.ashampoo.com/ashampoo_winoptimizer_28.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64

  softwareName   = 'ashampoo-winoptimizer-28*'

  checksum       = 'C21309474FFCF62B38373E432D02B3819A5E2B8E7C8B0E036DED0389E8940DD4'
  checksumType   = 'sha256'
  checksum64     = 'C21309474FFCF62B38373E432D02B3819A5E2B8E7C8B0E036DED0389E8940DD4'
  checksumType64 = 'sha256'

  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).Install.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs