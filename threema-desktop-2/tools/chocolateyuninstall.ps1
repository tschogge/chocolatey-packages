$ErrorActionPreference = 'Stop'
$appxPackageName = "Threema.Desktop.Consumer"

Write-Host "Trying to get package by Name: $appxPackageName"
$result = Get-AppxPackage -Name $appxPackageName
if ($result) {
  Remove-AppxPackage -Package $result.PackageFullName
}
else {
  Write-Host "Couldn't find package by Name: $appxPackageName"
  exit 1
}

Write-Host "Successfully removed $env:ChocolateyPackageName"