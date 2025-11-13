$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://getcoldturkey.com/files/Cold_Turkey_Installer.exe?v=26Aug25'
$url64 = 'https://getcoldturkey.com/files/Cold_Turkey_Installer.exe?v=26Aug25'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64

  softwareName   = 'cold-turkey-blocker*'

  checksum       = '430BF364964C9178AE3EB09FEE9F0B2278D37DFFA60533E4C072C7D9C469C730'
  checksumType   = 'sha256'
  checksum64     = '430BF364964C9178AE3EB09FEE9F0B2278D37DFFA60533E4C072C7D9C469C730'
  checksumType64 = 'sha256'

  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /LOG="C:\temp\install.log"'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs