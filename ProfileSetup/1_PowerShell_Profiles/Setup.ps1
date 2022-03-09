$ProfileFolder = "$env:USERPROFILE\Documents\WindowsPowerShell\"

Get-ChildItem "$PSScriptRoot\Profiles" | ForEach-Object {
    Copy-Item -Path $_.FullName-Destination $ProfileFolder -Force
}

