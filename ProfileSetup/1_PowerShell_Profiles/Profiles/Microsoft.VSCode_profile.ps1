$_Identifier = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$_S = ">"
if ($_Identifier.Owner -match "S-1-5-32-544") { $_S = "#" }

Remove-Variable -Name _Identifier

function prompt {
    Write-Host $PWD.Path.Replace($env:USERPROFILE, "~") -ForegroundColor Yellow
    return "Code $_S "
}
