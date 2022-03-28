$WingetApp = Get-Command winget -ErrorAction Ignore

if ($WingetApp) {
    winget install nushell
    return
}

$DownloadLink = ((Invoke-WebRequest https://github.com/nushell/nushell/releases/latest).Links | Where-Object href -like "/nushell/nushell/releases/download*windows.msi").href

New-Item "$env:LOCALAPPDATA\nushell" -Force -ItemType Directory

$Source = "https://github.com$DownloadLink"
$Destination = "$env:LOCALAPPDATA\nushell\nushell_install.msi"

Start-BitsTransfer -Source $Source -Destination $Destination -Confirm:$false

Start-Process -FilePath msiexec -ArgumentList "/i", $Destination, "/passive" -Wait

