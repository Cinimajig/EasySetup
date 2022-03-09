$_Identifier = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$_S = ">"
$_Username = $env:USERNAME.ToUpper()
if ($_Identifier.Owner -match "S-1-5-32-544") { $_S = "#" }

Remove-Variable -Name _Identifier

function prompt {
    Write-Host $PWD.Path.Replace($env:USERPROFILE, "~") -ForegroundColor Yellow
    return "$_Username (ISE) $_S "
}
