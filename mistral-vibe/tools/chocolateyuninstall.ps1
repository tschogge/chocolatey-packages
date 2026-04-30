# IMPORTANT: Before releasing this package, copy/paste the next 2 lines into PowerShell to remove all comments from this file:
#   $f='c:\path\to\thisFile.ps1'
#   gc $f | ? {$_ -notmatch "^\s*#"} | % {$_ -replace '(^.*?)\s*?[^``]#.*','$1'} | Out-File $f+".~" -en utf8; mv -fo $f+".~" $f

$ErrorActionPreference = 'Stop'
$packageName = $env:ChocolateyPackageName

Write-Host "Uninstalling $packageName..."

# Check if uv is available
$uvAvailable = (Get-Command uv -ErrorAction SilentlyContinue) -ne $null

if ($uvAvailable) {
    # Check if mistral-vibe is installed via uv
    $vibeInstalled = & uv tool list 2>$null | Select-String -Pattern "mistral-vibe" -Quiet
    
    if ($vibeInstalled) {
        Write-Host "Uninstalling mistral-vibe via uv..."
        $uninstallProcess = Start-Process -FilePath "uv" -ArgumentList "tool uninstall mistral-vibe -y" -Wait -NoNewWindow -PassThru
        
        if ($uninstallProcess.ExitCode -ne 0) {
            Write-Warning "Failed to uninstall mistral-vibe. Exit code: $($uninstallProcess.ExitCode)"
        }
        else {
            Write-Host "mistral-vibe has been uninstalled successfully."
        }
    }
    else {
        Write-Host "mistral-vibe is not installed via uv. Nothing to uninstall for the package."
    }

    # Check if there are other uv tools installed
    $uvTools = & uv tool list 2>$null
    $otherTools = if ($uvTools) { $uvTools | Where-Object { $_ -and $_ -notmatch "mistral-vibe" } } else { @() }
    
    # Ask if user wants to remove uv as well
    if ($otherTools.Count -eq 0 -or ($otherTools -join "").Length -eq 0) {
        Write-Host ""
        Write-Host "No other uv tools found installed."
        $choice = Read-Host "Do you want to uninstall uv as well? (y/N)"
        
        if ($choice -eq 'y' -or $choice -eq 'Y' -or $choice -eq 'yes' -or $choice -eq 'Yes') {
            Write-Host "Uninstalling uv..."
            Write-Host "Attempting to uninstall uv via Chocolatey..."
            try {
                $chocoUninstall = Start-Process -FilePath "choco" -ArgumentList "uninstall uv -y --no-progress" -Wait -NoNewWindow -PassThru
                
                if ($chocoUninstall.ExitCode -eq 0) {
                    Write-Host "uv uninstalled successfully via Chocolatey."
                }
                else {
                    throw "Chocolatey uninstall failed"
                }
            }
            catch {
                Write-Host "Chocolatey uninstall failed or uv not installed via Chocolatey. Trying manual uninstall..."
                
                # Manual uninstall: remove uv installation directory and clean up PATH
                $uvDir = Join-Path $env:LOCALAPPDATA "uv"
                $uvBinDir = Join-Path $env:LOCALAPPDATA "uv\bin"
                
                if (Test-Path $uvDir) {
                    Write-Host "Removing uv installation directory: $uvDir"
                    try {
                        Remove-Item -Path $uvDir -Recurse -Force -ErrorAction Stop
                        Write-Host "uv directory removed successfully."
                        
                        Uninstall-ChocolateyPath -Path $uvBinDir -PathType "Machine"
                        Uninstall-ChocolateyPath -Path $uvDir -PathType "Machine"
                        Uninstall-ChocolateyPath -Path $uvBinDir -PathType "User"
                        Uninstall-ChocolateyPath -Path $uvDir -PathType "User"

                        Write-Host "uv has been uninstalled manually. Please restart your terminal."
                    }
                    catch {
                        Write-Warning "Failed to remove uv directory or clean PATH: $_"
                        Write-Warning "Please remove $uvDir manually and update your PATH environment variable."
                    }
                }
                else {
                    $uvPath = (Get-Command uv).Source
                    if ($uvPath) {
                        $uvInstallDir = Split-Path $uvPath -Parent
                        Write-Warning "uv installation directory not found at $uvDir. It might be installed at: $uvInstallDir"
                        Write-Warning "Please remove the uv installation directory manually."
                    }
                    else {
                        Write-Warning "Could not locate uv installation directory. Please uninstall manually."
                    }
                }
            }
        }
        else {
            Write-Host "uv remains installed on your system."
        }
    }
    else {
        Write-Host "Other uv tools are still installed. uv will NOT be uninstalled."
        Write-Host "Installed uv tools: $($otherTools -join ", ")"
    }
}
else {
    Write-Host "uv is not available. Cannot uninstall mistral-vibe via uv."
    Write-Warning "Please install uv and manually run 'uv tool uninstall mistral-vibe' to remove the package."
}

Write-Host "$packageName uninstallation process completed."
