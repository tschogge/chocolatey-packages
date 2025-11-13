$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://cdn1.ashampoo.net/ashampoo/0401/ashampoo_app_2.12.7.exe'
$url64      = 'https://cdn1.ashampoo.net/ashampoo/0401/ashampoo_app_2.12.7.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'ashampoo-app*'

  checksum      = '52D8D1C5E21330F5C77F8DD61E09D2C68ECAF1489C686A717E12AA58210DC7BD'
  checksumType  = 'sha256'
  checksum64    = '52D8D1C5E21330F5C77F8DD61E09D2C68ECAF1489C686A717E12AA58210DC7BD'
  checksumType64= 'sha256'

  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /LOG=`"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).Install.log`""
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs