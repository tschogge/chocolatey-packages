$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://cdn1.ashampoo.net/ashampoo/0401/ashampoo_app_2.18.2.exe'
$url64 = 'https://cdn1.ashampoo.net/ashampoo/0401/ashampoo_app_2.18.2.exe'
$checksum = 'E966262674E47E4973F48D8A5249B866D6F7AE15B736D31BBD55CD666320165D'

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