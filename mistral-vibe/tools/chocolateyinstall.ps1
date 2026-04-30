$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
Write-Host "Installing $packageName..."

# Check if uv is already installed and available in PATH
$uvAvailable = $null -ne (Get-Command uv -ErrorAction SilentlyContinue)

if (-not $uvAvailable) {
    Write-Host "uv is not found. Installing uv..."
    
    # Try to install uv via Chocolatey first (preferred method)
    Write-Host "Attempting to install uv via Chocolatey..."
    try {
        $chocoInstall = Start-Process -FilePath "choco" -ArgumentList "install uv -y --no-progress" -Wait -NoNewWindow -PassThru
        
        if ($chocoInstall.ExitCode -eq 0) {
            Write-Host "uv installed successfully via Chocolatey."
        }
        else {
            throw "Chocolatey install failed"
        }
    }
    catch {
        Write-Host "Chocolatey install failed or not available. Falling back to direct installer..."
        
        # Fallback: Install uv using the official PowerShell installer
        $uvInstallScript = "irm https://astral.sh/uv/install.ps1 | iex"
        $uvInstallProcess = Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -Command `$uvInstallScript" -Wait -NoNewWindow -PassThru
        
        if ($uvInstallProcess.ExitCode -ne 0) {
            throw "uv installation failed with exit code $($uvInstallProcess.ExitCode)"
        }
        
        Write-Host "uv installed successfully via direct installer."
    }
    
    # Refresh environment to ensure uv is in PATH
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine) + ";" + 
    [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::User)
}
else {
    Write-Host "uv is already installed."
}

# Verify uv is available
$uvAvailable = $null -ne (Get-Command uv -ErrorAction SilentlyContinue)
if (-not $uvAvailable) {
    throw "uv is still not available after installation attempt. Please install it manually."
}

# Install mistral-vibe using uv
Write-Host "Installing mistral-vibe via uv..."
$installProcess = Start-Process -FilePath "uv" -ArgumentList "tool install mistral-vibe" -Wait -NoNewWindow -PassThru

if ($installProcess.ExitCode -ne 0) {
    throw "mistral-vibe installation failed with exit code $($installProcess.ExitCode)"
}

Write-Host "$packageName has been installed successfully."
