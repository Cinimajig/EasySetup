if (-not (Test-Path "$env:APPDATA\alacritty\alacritty.yml")) {
    New-Item "$env:APPDATA\alacritty" -Force -ItemType Directory
}

Copy-Item -Path "$PSScriptRoot\alacritty.yml" -Destination "$env:APPDATA\alacritty" -Force
