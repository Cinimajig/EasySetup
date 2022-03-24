$ProfileFolder = "$env:USERPROFILE\Documents\WindowsPowerShell\"

if (-not (Test-Path $ProfileFolder)) {
    New-Item $ProfileFolder -ItemType Directory -Force | Out-Null
}

Get-ChildItem "$PSScriptRoot\Profiles" | ForEach-Object {
    Copy-Item -Path $_.FullName -Destination $ProfileFolder -Force
}

Copy-Item -Path "$PSScriptRoot\user.config" -Destination "$env:LOCALAPPDATA\Microsoft_Corporation\powershell_ise.exe_StrongName_lw2v2vm3wmtzzpebq33gybmeoxukb04w\3.0.0.0" -Force