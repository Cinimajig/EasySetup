$NewItem = "$env:USERPROFILE\bin"

if (-not (Test-Path $NewItem)) {
    New-Item $NewItem -ItemType Directory
}

if ($env:Path.Contains($NewItem)) {
    return
}

setx.exe Path ($env:Path + ";" + $NewItem)
