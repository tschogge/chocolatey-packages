$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://download.adguardcdn.com/d/30005/adguardInstaller.exe?source=&exid=eg0poaxc9rt7gdo0'
$checksum = '8F34F4E5A9451861D9B8FB45DE27A428BA510EF3B9180CEB2E122D0A3AA989A5'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url

  softwareName  = 'adguard*'

  checksum      = $checksum
  checksumType  = 'sha256'
  checksum64    = $checksum
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).ExeInstall.log`" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs