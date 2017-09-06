# Authors: Mark Ebert
# Copyright (c) 2017 

# Check for administrator rights, if none then self elevate.
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# Write welcome message
Write-Output "Welcome to the GPO importer!"
# Pause period so that the user can read the message
Start-Sleep -s 1

# Prompt user if they would like to continue
Write-Output "Are you sure you would like to import all of the GPOs located with the 'ImportGPOs' folder?"

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
        Write-Output "Importing the GPOs..."
        Write-Output ""

        Set-Location $PSScriptRoot
        $backupPath = $PSScriptRoot + '\ImportGPOs'
		New-Item -ItemType Directory -Force -Path $backupPath
        .\LGPO\LGPO.exe /g $backupPath
        
        Write-Output ""
        Write-Output "Done importing the GPOs!"
    }
    # If the user selected to not continue
    "no" {
        Write-Output ""
        Write-Output "Not importing any GPOs!"
    }
}

# Alert the user that the window will auto close in 10 seconds
Write-Output ""
Write-Output "This script will exit in 10 seconds...."
# Pause before exiting so that the user has time to read the final output
Start-Sleep -s 10
# Exit this script
exit