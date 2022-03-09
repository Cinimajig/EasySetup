Get-ChildItem $PSScriptRoot -Directory -Exclude "_*" | ForEach-Object {
    $SetupScript = $_.FullName + "\Setup.ps1"

    # Invoke script.
    Write-Host "Running", $_.BaseName, "..."
    . $SetupScript
}
