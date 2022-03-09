Get-ChildItem $PSScriptRoot -Directory -Exclude "_*" | ForEach-Object {
    $SetupScript = $_.FullName + "\Setup.ps1"

    # Invoke script.
    Write-Host "Running", $_.BaseName, "..."
    . $SetupScript
}

# # Setup PowerShell profiles.
# . "$PSScriptRoot\PowerShell_Profiles\Setup.ps1"

# # Setup console colors with defaults.
# . "$PSScriptRoot\Console_Colors\Setup.ps1"

# # Setup bin folder in userspace, for easy access to scripts.
# . "$PSScriptRoot\Bin_Path\Setup.ps1"

# # Install Scripts file for easy admin prompts and .vbs debugging.
# . "$PSScriptRoot\VBS_Magic\Setup.ps1"
