Get-ChildItem $PSScriptRoot -Directory -Exclude "_*" | ForEach-Object {
    $SetupScript = $_.FullName + "\Setup.ps1"

    # Invoke script.
    Write-Host "Installing", $_.BaseName, "..."
    . $SetupScript
}
