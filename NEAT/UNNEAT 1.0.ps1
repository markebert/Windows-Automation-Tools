# Application Authors: Mark Ebert
# Copyright (c) 2017 
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Write-Host "UUUUUUUU     UUUUUUUUNNNNNNNN        NNNNNNNNNNNNNNNN        NNNNNNNNEEEEEEEEEEEEEEEEEEEEEE               AAA         TTTTTTTTTTTTTTTTTTTTTTT
U::::::U     U::::::UN:::::::N       N::::::NN:::::::N       N::::::NE::::::::::::::::::::E              A:::A        T:::::::::::::::::::::T
U::::::U     U::::::UN::::::::N      N::::::NN::::::::N      N::::::NE::::::::::::::::::::E             A:::::A       T:::::::::::::::::::::T
UU:::::U     U:::::UUN:::::::::N     N::::::NN:::::::::N     N::::::NEE::::::EEEEEEEEE::::E            A:::::::A      T:::::TT:::::::TT:::::T
U:::::U     U:::::U N::::::::::N    N::::::NN::::::::::N    N::::::N  E:::::E       EEEEEE           A:::::::::A     TTTTTT  T:::::T  TTTTTT
U:::::D     D:::::U N:::::::::::N   N::::::NN:::::::::::N   N::::::N  E:::::E                       A:::::A:::::A            T:::::T        
U:::::D     D:::::U N:::::::N::::N  N::::::NN:::::::N::::N  N::::::N  E::::::EEEEEEEEEE            A:::::A A:::::A           T:::::T        
U:::::D     D:::::U N::::::N N::::N N::::::NN::::::N N::::N N::::::N  E:::::::::::::::E           A:::::A   A:::::A          T:::::T        
U:::::D     D:::::U N::::::N  N::::N:::::::NN::::::N  N::::N:::::::N  E:::::::::::::::E          A:::::A     A:::::A         T:::::T        
U:::::D     D:::::U N::::::N   N:::::::::::NN::::::N   N:::::::::::N  E::::::EEEEEEEEEE         A:::::AAAAAAAAA:::::A        T:::::T        
U:::::D     D:::::U N::::::N    N::::::::::NN::::::N    N::::::::::N  E:::::E                  A:::::::::::::::::::::A       T:::::T        
U::::::U   U::::::U N::::::N     N:::::::::NN::::::N     N:::::::::N  E:::::E       EEEEEE    A:::::AAAAAAAAAAAAA:::::A      T:::::T        
U:::::::UUU:::::::U N::::::N      N::::::::NN::::::N      N::::::::NEE::::::EEEEEEEE:::::E   A:::::A             A:::::A   TT:::::::TT      
UU:::::::::::::UU  N::::::N       N:::::::NN::::::N       N:::::::NE::::::::::::::::::::E  A:::::A               A:::::A  T:::::::::T      
UU:::::::::UU    N::::::N        N::::::NN::::::N        N::::::NE::::::::::::::::::::E A:::::A                 A:::::A T:::::::::T      
UUUUUUUUU      NNNNNNNN         NNNNNNNNNNNNNNN         NNNNNNNEEEEEEEEEEEEEEEEEEEEEEAAAAAAA                   AAAAAAATTTTTTTTTTT      "
Write-Host "Thank you for using the No Touch Enterprise App Terminator (NEAT). Please wait while we make your computer UNNEAT!"
Start-Sleep -s 3
#Get-AppxPackage -AllUsers| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}

Write-Host "Your computer is now UNNEAT!"
Start-Sleep -s 10
exit