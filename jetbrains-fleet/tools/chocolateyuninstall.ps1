$ErrorActionPreference = 'Stop'
$packageName = $env:ChocolateyPackageName

Write-Host 'Removing start menu shortcut...'
$startMenuShortcut = Join-Path $env:ProgramData 'Microsoft\Windows\Start Menu\Programs\JetBrains Fleet.lnk'

if (Test-Path $startMenuShortcut) {
  Remove-Item $startMenuShortcut -Force
  Write-Host "Removed start menu shortcut: $startMenuShortcut"
}
else {
  Write-Host 'No start menu shortcut found, skipping!'
}

Write-Host 'Removing Desktop shortcut...'
$desktopShortcut = Join-Path ([Environment]::GetFolderPath('Desktop')) 'JetBrains Fleet.lnk'
if (Test-Path $desktopShortcut) {
  Remove-Item $desktopShortcut -Force
  Write-Host "Removed Desktop shortcut: $desktopShortcut"
}
else {
  Write-Host 'No Desktop shortcut found, skipping!'
}

Write-Host "$packageName was uninstalled!"