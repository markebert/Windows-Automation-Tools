# Authors: Mark Ebert
# Copyright (c) 2017 

# Check for administrator rights, if none then self elevate.
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# Write welcome message
Write-Output "Welcome to the GPO exporter!"
# Pause period so that the user can read the message
Start-Sleep -s 1

# Prompt user if they would like to continue
Write-Output "Are you sure you would like to export this computer GPOs into the 'BackupGPOs' folder?"

# Read the users answer until it is valid
$answer = Read-Host "Yes or No"
while ("yes", "no" -notcontains $answer) {
    $answer = Read-Host "Yes or No"
}

# Branch depending on the users answer
switch ($answer) {
    # If the user selected to continue
    "yes" {
        Write-Output ""
        Write-Output "Exprting your current GPOs..."
        Write-Output ""

        Set-Location $PSScriptRoot
        $backupPath = $PSScriptRoot + '\BackupGPOs'
        .\LGPO\LGPO.exe /b $backupPath
        
        Write-Output ""
        Write-Output "Done exporting the GPOs!"
    }
    # If the user selected to not continue
    "no" {
        Write-Output ""
        Write-Output "Not exporting any GPOs!"
    }
}

# Alert the user that the window will auto close in 10 seconds
Write-Output ""
Write-Output "This script will exit in 10 seconds...."
# Pause before exiting so that the user has time to read the final output
Start-Sleep -s 10
# Exit this script
exit