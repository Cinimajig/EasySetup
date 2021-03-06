$Arc = 'amd64'

$AllUsers = 0
$AddToPath = 1
$CompileStdLib = 1

$Url = 'https://python.org/ftp/python'
$Content = Invoke-WebRequest -Uri $Url

$Versions = @()
foreach($Link in $Content.ParsedHtml.links) {
    [String]$Major, [String]$Minor, [String]$Build = $Link.innerText.Replace('/', '').Split('.')
    
    if ("$Major.$Minor.$Build" -match '\d{1,10}\.\d{1,10}\.\d{1,10}') {

        $Obj = New-Object PSCustomObject
        $Obj | Add-Member -MemberType NoteProperty -Name Major -Value $($Major -as [Int])
        $Obj | Add-Member -MemberType NoteProperty -Name Minor -Value $($Minor -as [Int])
        $Obj | Add-Member -MemberType NoteProperty -Name Build -Value $($Build -as [Int])
        
        $Versions += $Obj
    }
}

foreach($Version in ($Versions | Sort-Object Major,Minor,Build -Descending)) {
    $BitsError = $null
    $Major, $Minor, $Build = $Version.Major, $Version.Minor, $Version.Build
    $DownloadLink = "https://www.python.org/ftp/python/$Major.$Minor.$Build/python-$Major.$Minor.$Build-$Arc.exe"

    Start-BitsTransfer $DownloadLink -Destination $env:TEMP -ErrorVariable BitsError -ErrorAction SilentlyContinue

    if (-not $BitsError) {
        break
    }   
}

Start-Process "$env:TEMP\python-$Major.$Minor.$Build-$Arc.exe" -ArgumentList "/quiet", "Include_launcher=1", "InstallAllUsers=$AllUsers", "InstallLauncherAllUsers=$AllUsers", "CompileAll=$CompileStdLib", "PrependPath=$AddToPath" -Wait

