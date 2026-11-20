$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://static.adguard.com/windows/setup64.msi'
$checksum64 = 'D168697C36B3DF7273113C4C19E37D4801A1642AD224329164EBB7DDBBDA8247'
$url32 = 'https://static.adguard.com/windows/setup86.msi'
$checksum32 = '8B2BD279586B4DF0F6448F7DD1C030E18E7C2BCD980E185AF6A2875E5B729A25'

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