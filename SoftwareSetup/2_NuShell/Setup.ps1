param(
    [parameter(Mandatory = $false)]
    [pscredential]$Credential
)

$WingetApp = Get-Command winget -ErrorAction Ignore

if (-not (Test-Path "$env:APPDATA\nushell")) {
    New-Item "$env:APPDATA\nushell" -Force -ItemType Directory
}

Copy-Item -Path "$PSScriptRoot\config.nu" -Destination "$env:APPDATA\nushell" -Force

if ($WingetApp) {
    winget install nushell
    return
}

$DownloadLink = ((Invoke-WebRequest https://github.com/nushell/nushell/releases/latest).Links | Where-Object href -like "/nushell/nushell/releases/download*windows.msi").href

if (-not (Test-Path "$env:LOCALAPPDATA\EasySetup")) { 
    New-Item "$env:LOCALAPPDATA\EasySetup" -Force -ItemType Directory
}

$Source = "https://github.com$DownloadLink"
$Destination = "$env:LOCALAPPDATA\EasySetup\nushell_install.msi"

Start-BitsTransfer -Source $Source -Destination $Destination -Confirm:$false

if ($Credential.UserName -eq "S-1-5-32-544") {
    Start-Process -FilePath msiexec -ArgumentList "/i", $Destination, "/passive" -Wait -Verb RunAs
}

Start-Process -FilePath msiexec -ArgumentList "/i", $Destination, "/passive" -Wait -Credential $Credential -Verb RunAs

