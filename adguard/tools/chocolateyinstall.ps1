$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://static.adguard.com/windows/setup64.msi'
$checksum64 = 'F9EEE88D38677F85340969AD29B2CCCF31EF0B32C9138D38FDA15B746458DE2D'
$url32 = 'https://static.adguard.com/windows/setup86.msi'
$checksum32 = '23CCD9A1CF99ACE647BFEF5B4A737C2AEC5227A44514ACCE5D3F124841EC079C'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url32
  url64bit      = $url64

  softwareName  = 'adguard*'

  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs