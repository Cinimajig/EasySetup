$_Identifier = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$_S = ">"
$ESC = [Char]27
$_Username = $env:USERNAME.ToUpper()

if ($_Identifier.Owner -match "S-1-5-32-544") { $_S = "#" }

Remove-Variable -Name _Identifier
Remove-Item "Alias:\cd" -ErrorAction Ignore

function cd {
    if ($args) {
        Set-Location $args[0]
    } else {
        Set-Location $HOME
    }
}

function cd.. {
    Set-Location ..
}

function prompt {
    return $_Username + " $ESC[33;1m$($PWD.Path.Replace($env:USERPROFILE, "~"))`n$("$ESC[m")$_S "
}

