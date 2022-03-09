@ECHO OFF

CD "%~dp0"

powershell.exe -NoProfile -ExecutionPolicy ByPass -File ProfileSetup\Setup.ps1

