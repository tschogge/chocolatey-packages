$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileName   = 'Cold_Turkey_Micromanager_Free_Installer-1.3.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file         = "$toolsDir\$fileName"

  softwareName  = 'micro-manager-free*'

  checksum      = '4E4A6BA066CAF4E7F124451EDDE48D9B3138D3F6CC534C141D2773A5795432A4'
  checksumType  = 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /LOG="C:\temp\install.log"'
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs

$installPath = "${env:ProgramFiles}\Cold Turkey Micromanager"
$exeFile = Get-ChildItem -Path $installPath -Filter *.exe -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1

if ($exeFile -and $exeFile.Exists) {
    $startMenuPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Cold Turkey"
    
    if (!(Test-Path $startMenuPath)) {
        New-Item -ItemType Directory -Path $startMenuPath -Force | Out-Null
    }
    
    Install-ChocolateyShortcut -ShortcutFilePath "$startMenuPath\Micromanager Free.lnk" \
        -TargetPath "$($exeFile.FullName)" \
        -WorkingDirectory "$installPath"
}