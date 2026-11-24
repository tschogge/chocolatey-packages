$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://web.archive.org/web/20251201081257if_/https://download-cdn.jetbrains.com/fleet/installers/windows_x64/Fleet-1.48.261.zip'
$checksum = '16266B4A07914C4A99505CEF0543CF6E63CAF33E50F2BDBDB20B5DBCC7F6BE2B'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url64bit       = $url64
  softwareName   = 'jetbrains-fleet*'
  checksum64     = $checksum
  checksumType64 = 'sha256'
}

Write-Host 'Installing fleet...'
Install-ChocolateyZipPackage @packageArgs
Write-Host 'Installed fleet'

Write-Host 'Creating start menu shortcut..'
$fleetExe = Get-ChildItem -Path $toolsDir -Recurse -Filter 'fleet.exe' -File | Select-Object -First 1 -ExpandProperty FullName
$startMenu = Join-Path $env:ProgramData 'Microsoft\Windows\Start Menu\Programs\JetBrains Fleet.lnk'

$shortcutArgsStart = @{
  shortcutFilePath = $startMenu
  targetPath       = $fleetExe
  workingDirectory = (Split-Path $fleetExe)
  iconLocation     = $fleetExe
  description      = 'JetBrains Fleet - Code Editor'
}
Install-ChocolateyShortcut @shortcutArgsStart
Write-Host 'Installed start menu shortcut'

Write-Host 'Installing Desktop shortcut...'
$desktopPath = Join-Path [Environment]::GetFolderPath('Desktop') 'Fleet.lnk'

$shortcutArgsDesktop = @{
  shortcutFilePath = $desktopPath
  targetPath       = $fleetExe
  workingDirectory = (Split-Path $fleetExe)
  iconLocation     = $fleetExe
  description      = 'JetBrains Fleet - Code Editor'
}
Install-ChocolateyShortcut @shortcutArgsDesktop
Write-Host "Installed Desktop shortcut"