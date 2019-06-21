# Application Authors: Mark Ebert, Marco Duran
# Special thanks to Longwood CSD Technology Staff
# Copyright (c) 2019
# Version 3.0 for Windows 10 Build 1903
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
	"1527c705-839a-4832-9118-54d4Bd6a0c89",
	"c5e2524a-ea46-4f67-841f-6a9465d9d515",
	"C9B3B423.RingDoorbell",
	"CanonicalGroupLimited.UbuntuonWindows",
	"E2A4F912-2574-4A75-9BB0-0D023378592B",
	"F46D4000-FD22-4DB4-AC8E-4E1DDDE828FE",
	"InputApp",
	"Microsoft.AAD.BrokerPlugin",
	"Microsoft.AccountsControl",
	"Microsoft.Advertising.Xaml",
	"Microsoft.AsyncTextService",
	"Microsoft.BioEnrollment",
	"Microsoft.CredDialogHost",
	"Microsoft.DesktopAppInstaller",
	"Microsoft.ECApp",
	"Microsoft.HEIFImageExtension",
	"Microsoft.LockApp",
	"Microsoft.MicrosoftEdge",
	"Microsoft.MicrosoftEdgeDevToolsClient",
	"Microsoft.MicrosoftStickyNotes",
	"Microsoft.NET",
	"Microsoft.PPIProjection",
	"Microsoft.ScreenSketch",
	"Microsoft.Services.Store.Engagement",
	"Microsoft.StorePurchaseApp",
	"Microsoft.UI.Xaml.2.0",
	"Microsoft.UI.Xaml.2.1",
	"Microsoft.VCLibs",
	"Microsoft.VP9VideoExtensions",
	"Microsoft.Wallet",
	"Microsoft.WebMediaExtensions",
	"Microsoft.WebpImageExtension",
	"Microsoft.Win32WebViewHost",
	"Microsoft.Windows.Apprep.ChxApp",
	"Microsoft.Windows.AssignedAccessLockApp",
	"Microsoft.Windows.CallingShellApp",
	"Microsoft.Windows.CapturePicker",
	"Microsoft.Windows.CloudExperienceHost",
	"Microsoft.Windows.ContentDeliveryManager",
	"Microsoft.Windows.Cortana",
	"Microsoft.Windows.NarratorQuickStart",
	"Microsoft.Windows.OOBENetworkCaptivePortal",
	"Microsoft.Windows.OOBENetworkConnectionFlow",
	"Microsoft.Windows.ParentalControls",
	"Microsoft.Windows.PeopleExperienceHost",
	"Microsoft.Windows.Photos",
	"Microsoft.Windows.PinningConfirmationDialog",
	"Microsoft.Windows.SecHealthUI",
	"Microsoft.Windows.SecureAssessmentBrowser",
	"Microsoft.Windows.ShellExperienceHost",
	"Microsoft.Windows.StartMenuExperienceHost",
	"Microsoft.Windows.XGpuEjectDialog",
	"Microsoft.WindowsCalculator",
	"Microsoft.WindowsCamera",
	"Microsoft.WindowsSoundRecorder",
	"Microsoft.WindowsStore",
	"Microsoft.Xbox.TCUI",
	"Microsoft.XboxApp",
	"Microsoft.XboxGameCallableUI",
	"Microsoft.XboxGameOverlay",
	"Microsoft.XboxGamingOverlay",
	"Microsoft.XboxIdentityProvider",
	"Microsoft.XboxSpeechToTextOverlay",
	"Windows.CBSPreview",
	"windows.immersivecontrolpanel",
	"Windows.PrintDialog"
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