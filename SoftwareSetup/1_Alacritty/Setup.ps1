param(
    [parameter(Mandatory = $false)]
    [pscredential]$Credential
)

if (-not (Test-Path "$env:APPDATA\alacritty\alacritty.yml")) {
    New-Item "$env:APPDATA\alacritty" -Force -ItemType Directory
}

Copy-Item -Path "$PSScriptRoot\alacritty.yml" -Destination "$env:APPDATA\alacritty" -Force

$Links = (Invoke-WebRequest https://github.com/alacritty/alacritty/releases/latest).Links
$DownloadLink = ($Links | Where-Object href -like "/alacritty/alacritty/releases/download*installer.msi").href
$DownloadLinkConfig = ($Links | Where-Object href -like "/alacritty/alacritty/releases/download*alacritty.yml").href

if (-not (Test-Path "$env:LOCALAPPDATA\EasySetup")) { 
    New-Item "$env:LOCALAPPDATA\EasySetup" -Force -ItemType Directory
}

$Source = "https://github.com$DownloadLink"
$SourceConfig = "https://github.com$DownloadLink"
$Destination = "$env:LOCALAPPDATA\EasySetup\alacritty_install.msi"
$DestinationConfig = "$env:APPDATA\alacritty\alacritty.yml")

Start-BitsTransfer -Source $Source -Destination $Destination -Confirm:$false

if (-not (Test-Path "$env:APPDATA\alacritty\alacritty.yml")) {
    Start-BitsTransfer -Source $SourceConfig -Destination $DestinationConfig -Confirm:$false
}

if ($Credential.UserName -eq "S-1-5-32-544") {
    Start-Process -FilePath msiexec -ArgumentList "/i", $Destination, "/passive" -Wait -Verb RunAs
}

Start-Process -FilePath msiexec -ArgumentList "/i", $Destination, "/passive" -Wait -Credential $Credential -Verb RunAs

