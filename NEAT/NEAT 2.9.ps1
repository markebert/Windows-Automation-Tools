# Application Authors: Mark Ebert, Marco Duran
# Special thanks to Longwood CSD Technology Staff
# Copyright (c) 2018
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
Write-Host "Thank you for using the No Touch Enterprise App Terminator (NEAT). Please wait while we make your computer NEAT!"
Start-Sleep -s 3

$packageArray = Get-AppxPackage -AllUsers
$exclusionPackageArray = @(
	"c5e2524a-ea46-4f67-841f-6a9465d9d515",
    "1527c705-839a-4832-9118-54d4Bd6a0c89",
    "E2A4F912-2574-4A75-9BB0-0D023378592B",
    "F46D4000-FD22-4DB4-AC8E-4E1DDDE828FE",
	"ContactSupport",
	"CortanaListenUIApp",
	"DesktopLearning",
	"HoloCamera",
	"HoloItemPlayerApp",
	"HoloShell",
	"AAD.BrokerPlugin",
	"PPIProjection",
	"Cortana",
	"HolographicFirstRun",
	"ModalSharePickerHost",
	"OOBENetworkCaptivePortal",
	"OOBENetworkConnectionFlow",
	"ParentalControls",
	"SecHealthUI",
	"SecondaryTileExperience",
	"MiracastView",
	"Wallet",
    "DesktopAppInstaller",
    "Store",
    "WindowsCalculator",
    "StickyNotes",
    "Xbox",
    "Photos",
    "Alarms",
    "AccountsControl",
    ".NET.",
    "MicrosoftEdge",
    "LockApp",
    "PrintDialog",
    "ShellExperienceHost",
    "CredDialogHost",
    "BioEnrollment",
    "AssignedAccessLockApp",
    "Apprep.ChxApp",
    "CloudExperienceHost",
    "ContentDeliveryManager",
    "immersivecontrolpanel",
    "InputApp",
    "VCLibs",
    "EnvironmentsApp",
    "DesktopView",
    "SecureAssessmentBrowser",
    "WindowPicker",
    "Microsoft.Advertising.Xaml",
	"Microsoft.AsyncTextService",
	"Microsoft.Win32WebViewHost",
	"Microsoft.Windows.CapturePicker",
    "Microsoft.Windows.PeopleExperienceHost",
    "Microsoft.Windows.PinningConfirmationDialog",
    "Microsoft.ECApp",
	"Microsoft.Windows.NarratorQuickStart",
	"Microsoft.Windows.XGpuEjectDialog",
	"Microsoft.UI.Xaml.2.0",
	"Microsoft.YourPhone",
	"Windows.CBSPreview",
	"CanonicalGroupLimited.UbuntuonWindows"
)

forEach ($package in $packageArray) {
    $deletePackage = $true
    foreach ($exclusionPackage in $exclusionPackageArray) {
        if ($package.Name.ToLower().Contains($exclusionPackage.ToLower())) {
            # Don't remove the app package
            $deletePackage = $false
            break
        }
    }
    if ($deletePackage -eq $true) {
        Write-Host "Deleting" $package.Name
        try {
            Get-AppxProvisionedPackage $package.Name -AllUsers | Remove-AppxProvisionedPackage -online
        }
        catch {
            # Do Nothing
        }
		try {
            Get-AppxPackage $package.Name -AllUsers | Remove-AppxPackage
        }
        catch {
            # Do Nothing
        }
    }
    else {
        Write-Host "Skipping" $package.Name "becuase it was part of the exclusion list."
    }
}

Write-Host "Your computer is now NEAT!"
Start-Sleep -s 10
exit