$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://cdn1.ashampoo.net/ashampoo/0401/ashampoo_app_2.13.0.exe'
$url64      = 'https://cdn1.ashampoo.net/ashampoo/0401/ashampoo_app_2.13.0.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'ashampoo-app*'

  checksum      = '4ECE417173413AF71DCFE8920D18352ACD4C3ACE8897B3DCA11915F149EFBBF9'
  checksumType  = 'sha256'
  checksum64    = '4ECE417173413AF71DCFE8920D18352ACD4C3ACE8897B3DCA11915F149EFBBF9'
  checksumType64= 'sha256'

  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /LOG=`"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).Install.log`""
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs