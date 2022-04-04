@ECHO OFF

CD "%~dp0"

powershell.exe -NoProfile -ExecutionPolicy ByPass -File UserSoftwareSetup\Setup.ps1

