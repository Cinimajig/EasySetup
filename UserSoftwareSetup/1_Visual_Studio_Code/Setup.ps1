$DownloadLink = "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user"
$Destination = "$env:LOCALAPPDATA\EasySetup\vscode_setup-win64.exe"

if (-not (Test-Path "$env:LOCALAPPDATA\EasySetup")) {
    New-Item "$env:LOCALAPPDATA\EasySetup" -Force -ItemType Directory
}

Start-BitsTransfer $DownloadLink -Destination $Destination

Start-Process $Destination -ArgumentList "/VERYSILENT", "/MERGETASKS=!runcode" -Wait

