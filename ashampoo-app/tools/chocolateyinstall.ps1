$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://cdn1.ashampoo.net/ashampoo/0401/ashampoo_app_2.19.2.exe'
$url64 = 'https://cdn1.ashampoo.net/ashampoo/0401/ashampoo_app_2.19.2.exe'
$checksum = '060C126FDFEE38272B3EA11DB27428054E9DBC963E38D71E1D210E9FE8012404'

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