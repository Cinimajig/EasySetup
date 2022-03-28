@ECHO OFF

CD "%~dp0"

powershell.exe -NoProfile -ExecutionPolicy ByPass -File SoftwareSetup\Setup.ps1
