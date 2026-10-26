$ErrorActionPreference = 'Stop'
$zipPath    = Join-Path $env:TEMP 'adguard_uninstall_utility.zip'
$unzipDir   = Join-Path $env:TEMP 'adguard_uninstall_utility'

$toolsUrl = 'https://static.adtidy.org/windows/uninstaller/uninstall_utility.zip'
$checksum = 'C5E32AF264D761305770161FE1216C0B8DF33539018F1FB8C6D07998F890F692'

Write-Host 'Downloading official Uninstall Tools'
Get-ChocolateyWebFile -PackageName $env:ChocolateyPackageName ` -FileFullPath $zipPath -Url $toolsUrl -Checksum $checksum -ChecksumType 'sha256'

Write-Host 'Unzipping tools...'
Get-ChocolateyUnzip -FileFullPath $zipPath -Destination $unzipDir

Write-Host 'Starting Admin process to uninstall...'
$utility = Join-Path $unzipDir 'Adguard.UninstallUtility.exe'
Start-ChocolateyProcessAsAdmin "`"$utility`" /console /adblocker /settings" -validExitCodes @(0, 3010, 1641)

Write-Host 'Removing Adguard files'
Remove-Item 'C:\ProgramData\Adguard' -Recurse -Force -ErrorAction SilentlyContinue