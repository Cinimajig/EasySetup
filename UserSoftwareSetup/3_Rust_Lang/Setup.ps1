if (-not (Test-Path "$env:LOCALAPPDATA\EasySetup")) { 
    New-Item "$env:LOCALAPPDATA\EasySetup" -Force -ItemType Directory
}

$Url = "https://static.rust-lang.org/rustup/dist/x86_64-pc-windows-msvc/rustup-init.exe"
Start-BitsTransfer $Url -Destination "$env:LOCALAPPDATA\EasySetup\rustup-init.exe"

Start-Process "$env:LOCALAPPDATA\EasySetup\rustup-init.exe" -ArgumentList "-q", "-y" -Wait

