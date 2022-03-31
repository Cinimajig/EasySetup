$Identity = [System.Security.Principal.WindowsIdentity]::GetCurrent()

if ($_Identifier.Owner -match "S-1-5-32-544") {
    $Cred = New-Object pscredential -ArgumentList "S-1-5-32-544", ("S-1-5-32-544" | ConvertTo-SecureString -AsPlainText -Force)
} else {
    $Cred = Get-Credential -Message "Please enter a administrator password for installing system software."
}

Get-ChildItem $PSScriptRoot -Directory -Exclude "_*" | ForEach-Object {
    $SetupScript = $_.FullName + "\Setup.ps1"

    # Invoke script.
    Write-Host "Installing", $_.BaseName, "..."
    . $SetupScript -Credential $Cred
}
