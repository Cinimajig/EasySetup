Get-ChildItem "$PSScriptRoot\Scripts" | ForEach-Object {
    Copy-Item -Path $_.FullName -Destination "$env:USERPROFILE\bin" -Force
}

