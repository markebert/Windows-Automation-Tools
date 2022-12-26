# Application Authors: Mark Ebert
# Copyright (c) 2022
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Write-Host "Welcome to the NEAT Program Finder! All available programs will be listed shortly..."
Write-Host
Start-Sleep -s 3

$packageArray = Get-AppxPackage -AllUsers

forEach ($package in $packageArray) {
    Write-Host $package.Name
}

Write-Host
Write-Host "NEAT Program Finder finished."
pause