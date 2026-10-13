$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://drive.usercontent.google.com/download?id=1hCQdJ6fEEcb1mROWmuB1alXLwCLKo-57&export=download&authuser=0&confirm=t&uuid=decbb1bd-d432-4bab-b827-fc3d463c12a8&at=AMrWOn1-10tZ6YlGJLSCHxRjZyRg%3A1791891288129'
$url64 = 'https://drive.usercontent.google.com/download?id=1hCQdJ6fEEcb1mROWmuB1alXLwCLKo-57&export=download&authuser=0&confirm=t&uuid=decbb1bd-d432-4bab-b827-fc3d463c12a8&at=AMrWOn1-10tZ6YlGJLSCHxRjZyRg%3A1791891288129'
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