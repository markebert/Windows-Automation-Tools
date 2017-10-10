# Application Authors: Mark Ebert
# Copyright (c) 2017 
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Write-Host "  NNNNNNNN        NNNNNNNNEEEEEEEEEEEEEEEEEEEEEE               AAA         TTTTTTTTTTTTTTTTTTTTTTT
  N:::::::N       N::::::NE::::::::::::::::::::E              A:::A        T:::::::::::::::::::::T
  N::::::::N      N::::::NE::::::::::::::::::::E             A:::::A       T:::::::::::::::::::::T
  N:::::::::N     N::::::NEE::::::EEEEEEEEE::::E            A:::::::A      T:::::TT:::::::TT:::::T
  N::::::::::N    N::::::N  E:::::E       EEEEEE           A:::::::::A     TTTTTT  T:::::T  TTTTTT
  N:::::::::::N   N::::::N  E:::::E                       A:::::A:::::A            T:::::T        
  N:::::::N::::N  N::::::N  E::::::EEEEEEEEEE            A:::::A A:::::A           T:::::T        
  N::::::N N::::N N::::::N  E:::::::::::::::E           A:::::A   A:::::A          T:::::T        
  N::::::N  N::::N:::::::N  E:::::::::::::::E          A:::::A     A:::::A         T:::::T        
  N::::::N   N:::::::::::N  E::::::EEEEEEEEEE         A:::::AAAAAAAAA:::::A        T:::::T        
  N::::::N    N::::::::::N  E:::::E                  A:::::::::::::::::::::A       T:::::T        
  N::::::N     N:::::::::N  E:::::E       EEEEEE    A:::::AAAAAAAAAAAAA:::::A      T:::::T        
  N::::::N      N::::::::NEE::::::EEEEEEEE:::::E   A:::::A             A:::::A   TT:::::::TT      
  N::::::N       N:::::::NE::::::::::::::::::::E  A:::::A               A:::::A  T:::::::::T      
  N::::::N        N::::::NE::::::::::::::::::::E A:::::A                 A:::::A T:::::::::T      
  NNNNNNNN         NNNNNNNEEEEEEEEEEEEEEEEEEEEEEAAAAAAA                   AAAAAAATTTTTTTTTTT      "
Write-Host "Thank you for using the No Touch Enterprise App Terminator (NEAT). Please wait while we make your computer UN-NEAT!"
Start-Sleep -s 3
Get-AppxPackage -AllUsers| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}

Write-Host "Your computer is now UN-NEAT!"
Start-Sleep -s 5
exit