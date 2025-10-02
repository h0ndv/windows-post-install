## Set-ExecutionPolicy Unrestricted

function Show-Menu {
    Clear-Host
    Write-Host "===== Windows Post Install =====" -ForegroundColor Cyan
    Write-Host "[1] Basic Apps Installation" -ForegroundColor Green
    Write-Host "[2] Install Apps from Apps Folder" -ForegroundColor Green
    Write-Host "[3] Office Deployment Tool (ODT)" -ForegroundColor Yellow
    Write-Host "[4] Microsoft Activation Script - https://massgrave.dev/" -ForegroundColor Yellow
    Write-Host
    Write-Host "===== Install Others Apps =====" -ForegroundColor Cyan
    Write-Host "[5] Browsers"
    Write-Host "[6] Coding and IDEs"
    Write-Host "[7] Gaming"
    Write-Host "[8] Hardware Monitoring"
    Write-Host "[9] Music and Video Players"
    Write-Host "[10] Recording, Screenshots and Meetings"
    Write-Host "[11] Security and Privacy (VPNs)"
    Write-Host "[12] Office and PDF Applications"
    Write-Host
    Write-Host "===== Optimization Tools =====" -ForegroundColor Cyan
    Write-Host "[L] Run Windows Update" -ForegroundColor Yellow
    Write-Host "[U] Windows Update Control (Disable or Enable)" -ForegroundColor Yellow
    Write-Host "[D] Win11 Debloat - https://github.com/Raphire/Win11Debloat " -ForegroundColor Yellow
    Write-Host
    Write-Host "[X] Exit" -ForegroundColor Yellow
    Write-Host "[R] Restart system" -ForegroundColor Yellow
}

# Basic installation apps 
$WingetBasicList = @(
    "Google.Chrome",
    # "Microsoft.Office", # Microsoft 365 Enterprise en-us
    "RARLab.WinRAR",
    "Microsoft.WindowsTerminal",
    "Adobe.Acrobat.Reader.64-bit"
)

# Install basic apps
function InstallBasicApps {
    Write-Host "`nThe following apps will be installed:" -ForegroundColor Cyan
    $WingetBasicList | ForEach-Object { Write-Host "- $_" }

    $confirm = Read-Host "`nDo you want to continue? (Y/N)"

    if ($confirm -notmatch '^(Y|y)$') {
        Write-Host "Basic Apps Installation cancelled." -ForegroundColor Red
        Pause
        return
    }

    try { foreach ($app in $WingetBasicList) {
        Write-Host "`nInstalling $app...`n" -ForegroundColor Cyan
        try {
            winget install --accept-package-agreements --accept-source-agreements --id $app -e -h
        } catch {
            Write-Host "Failed to install $app :`n$($_.Exception.Message)" -ForegroundColor Red
        }
    }
    } catch {
        Write-Host "Failed to install basic apps: $($_.Exception.Message)" -ForegroundColor Red
        Pause
        return
    }

    Write-Host "`nBasic Apps Installation completed." -ForegroundColor Green

    # Install-WindowsUpdates
    Pause
}

# Browsers
$WingetBrowserList = @(
    @{ Name = "Brave Browser"; Id = "Brave.Brave" },
    @{ Name = "Google Chrome"; Id = "Google.Chrome" },
    @{ Name = "Microsoft Edge"; Id = "Microsoft.Edge" },
    @{ Name = "Mozilla Firefox"; Id = "Mozilla.Firefox" },
    @{ Name = "Opera GX"; Id = "Opera.OperaGX" },
    @{ Name = "Tor Browser"; Id = "TorProject.TorBrowser" },
    @{ Name = "Vivaldi Browser"; Id = "VivaldiTechnologies.Vivaldi" },
    @{ Name = "Waterfox"; Id = "Waterfox.Waterfox" }
)

# Coding and IDEs
$WingetCodingList = @(
    @{ Name = "Android Studio"; Id = "Google.AndroidStudio" },
    @{ Name = "Cursor"; Id = "Anysphere.Cursor" },
    @{ Name = "DBeaver"; Id = "DBeaver.DBeaver.Community" },
    @{ Name = "Docker Desktop"; Id = "Docker.DockerDesktop" },
    @{ Name = "Git Bash (Git for Windows)"; Id = "Git.Git" },
    @{ Name = "GitHub Desktop"; Id = "GitHub.GitHubDesktop" },
    @{ Name = "JetBrains PyCharm"; Id = "JetBrains.PyCharm.Community" },
    @{ Name = "JetBrains PhpStorm"; Id = "JetBrains.PyCharm.Community" },
    @{ Name = "MySQL Workbench"; Id = "Oracle.MySQLWorkbench" },
    @{ Name = "NeoVim"; Id = "Neovim.Neovim" },
    @{ Name = "NetBeans IDE"; Id = "Apache.NetBeans" },
    @{ Name = "Node.js LTS"; Id = "OpenJS.NodeJS.LTS" },
    @{ Name = "Notepad++"; Id = "Notepad++.Notepad++" },
    @{ Name = "Postman"; Id = "Postman.Postman" },
    @{ Name = "Python 3.9"; Id = "Python.Python.3.9" },
    @{ Name = "VirtualBox"; Id = "Oracle.VirtualBox" },
    @{ Name = "Visual Studio 2022 Community"; Id = "Microsoft.VisualStudio.2022.Community" },
    @{ Name = "Visual Studio Code"; Id = "Microsoft.VisualStudioCode" },
    @{ Name = "VSCodium"; Id = "VSCodium.VSCodium" },
    @{ Name = "Windows Terminal"; Id = "Microsoft.WindowsTerminal" },
    @{ Name = "WinMerge"; Id = "WinMerge.WinMerge" },
    @{ Name = "XAMPP"; Id = "ApacheFriends.XAMPP" },
    @{ Name = "Zed Editor"; Id = "zed.zed" }
)

# Gaming
$WingetGamingList = @(
    @{ Name = "Battle.net"; Id = "Blizzard.BattleNet" },
    @{ Name = "Discord"; Id = "Discord.Discord" },
    @{ Name = "Epic Games Launcher"; Id = "EpicGames.EpicGamesLauncher" },
    @{ Name = "GOG Galaxy"; Id = "GOG.Galaxy" },
    @{ Name = "OBS Studio"; Id = "OBSProject.OBSStudio" },
    @{ Name = "Riot Client"; Id = "RiotGames.RiotClient" },
    @{ Name = "Steam"; Id = "Valve.Steam" },
    @{ Name = "TeamSpeak"; Id = "TeamSpeakSystems.TeamSpeakClient" },
    @{ Name = "Ubisoft Connect"; Id = "Ubisoft.Connect" }
)

# Hardware Monitoring
$WingetHardwareList = @(
    @{ Name = "Core Temp"; Id = "ArthurLiberman.CoreTemp" },
    @{ Name = "CPU-Z"; Id = "CPUID.CPU-Z" },
    @{ Name = "CrystalDiskInfo"; Id = "CrystalDewWorld.CrystalDiskInfo" },
    @{ Name = "CrystalDiskMark"; Id = "CrystalDewWorld.CrystalDiskMark" },
    @{ Name = "GPU-Z"; Id = "techPowerUp.GPU-Z" },
    @{ Name = "MSI Afterburner"; Id = "MSIAfterburner.MSIAfterburner" },
    @{ Name = "Open Hardware Monitor"; Id = "OpenHardwareMonitor.OpenHardwareMonitor" },
    @{ Name = "Rufus - Create Bootable USB"; Id = "Rufus.Rufus" }
)

# Audio Players & Editors
$WingetAudioList = @(
    @{ Name = "AIMP"; Id = "AIMP.DevTeam.AIMP" },
    @{ Name = "Audacity"; Id = "Audacity.Audacity" }
    @{ Name = "foobar2000"; Id = "PeterPawlowski.foobar2000" },
    @{ Name = "iTunes"; Id = "Apple.iTunes" },
    @{ Name = "Winamp"; Id = "Radionomy.Winamp" }
)

# Video Players & Editors
$WingetVideoList = @(
    @{ Name = "Kodi"; Id = "XBMCFoundation.Kodi" },
    @{ Name = "Media Player Classic"; Id = "clsid2.mpc-hc" },
    @{ Name = "PotPlayer"; Id = "Daum.PotPlayer" },
    @{ Name = "VLC Media Player"; Id = "VideoLAN.VLC" }
)

# Streaming Apps
$WingetStreamingList = @(
    @{ Name = "Amazon Music"; Id = "Amazon.AmazonMusic" },
    @{ Name = "iTunes"; Id = "Apple.iTunes" },
    @{ Name = "Plex Media Player"; Id = "Plex.Plex" },
    @{ Name = "Spotify"; Id = "Spotify.Spotify" },
    @{ Name = "TIDAL"; Id = "TIDAL.TIDAL" }
)

# Define media categories
$MediaCategories = @{
    "Audio Players & Editors" = $WingetAudioList
    "Streaming Services" = $WingetStreamingList
    "Video Players & Editors" = $WingetVideoList
}

# Recording, Screenshots & Meetings Apps
$WingetScreenList = @(
    @{ Name = "AnyDesk"; Id = "AnyDeskSoftwareGmbH.AnyDesk" },
    @{ Name = "Lightshot"; Id = "Skillbrains.Lightshot" },
    @{ Name = "Microsoft Teams"; Id = "Microsoft.Teams" },
    @{ Name = "OBS Studio"; Id = "OBSProject.OBSStudio" },
    @{ Name = "RustDesk"; Id = "RustDesk.RustDesk" },
    @{ Name = "ShareX"; Id = "ShareX.ShareX" },
    @{ Name = "TeamViewer"; Id = "TeamViewer.TeamViewer" },
    @{ Name = "Zoom"; Id = "Zoom.Zoom" }
)

# Security and Privacy
$WingetSecurityList = @(
    @{ Name = "Avast Free Antivirus"; Id = "Avast.AvastFreeAntivirus" },
    @{ Name = "Bitdefender Antivirus Free"; Id = "Bitdefender.BitdefenderAntivirusFree" },
    @{ Name = "BleachBit"; Id = "BleachBit.BleachBit" },
    @{ Name = "GlassWire"; Id = "GlassWire.GlassWire" },
    @{ Name = "KeePassXC"; Id = "KeePassXCTeam.KeePassXC" },
    @{ Name = "Malwarebytes"; Id = "Malwarebytes.Malwarebytes" },
    @{ Name = "Mullvad VPN"; Id = "MullvadVPN.MullvadVPN" },
    @{ Name = "O&O ShutUp10++"; Id = "OandO.ShutUp10" },
    @{ Name = "ProtonVPN"; Id = "ProtonTechnologies.ProtonVPN" },
    @{ Name = "SimpleWall"; Id = "Henry++.simplewall" },
    @{ Name = "Tor Browser"; Id = "TorProject.TorBrowser" },
    @{ Name = "TunnelBear VPN"; Id = "TunnelBear.TunnelBear" },
    @{ Name = "Windscribe VPN"; Id = "Windscribe.Windscribe" },
    @{ Name = "Wireshark"; Id = "WiresharkFoundation.Wireshark" }
)

# Office and PDF Applications
$WingetOfficeList = @(
    @{ Name = "Adobe Acrobat Reader DC"; Id = "Adobe.Acrobat.Reader.64-bit" },
    @{ Name = "LibreOffice"; Id = "TheDocumentFoundation.LibreOffice" },
    @{ Name = "Microsoft 365 Enterprise en-us"; Id = "Microsoft.Office" },
    @{ Name = "Microsoft Office 2021"; Id = "Microsoft.Office.2021" },
    @{ Name = "Sumatra PDF"; Id = "SumatraPDF.SumatraPDF" },
    @{ Name = "PDF24 Creator"; Id = "PDF24.PDF24Creator" },
    @{ Name = "WPS Office"; Id = "Kingsoft.WPSOffice" }
)

# Show main menu
function Show-AppMenu {
    param (
        [Parameter(Mandatory)]
        [array]$AppList,
        [string]$Title = "PROGRAM INSTALLER"
    )

    while ($true) {
        Clear-Host
        Write-Host "===== $Title =====" -ForegroundColor Cyan

        for ($i = 0; $i -lt $AppList.Count; $i++) {
            Write-Host "[$($i + 1)] $($AppList[$i].Name)"
        }

        Write-Host "`n[0] Back" -ForegroundColor Yellow
        $choice = Read-Host "`nSelect an option"

        if ($choice -eq '0') {
            return
        }

        if (-not ($choice -match '^\d+$')) {
            Write-Host "Invalid input. Please enter a number." -ForegroundColor Red
            Pause
            continue
        }

        $index = [int]$choice - 1

        if ($index -lt 0 -or $index -ge $AppList.Count) {
            Write-Host "Option out of range." -ForegroundColor Red
            Pause
            continue
        }

        # Install apps using winGet
        $selectedApp = $AppList[$index]
        Write-Host "`nInstalling: $($selectedApp.Name)`n" -ForegroundColor Yellow

        winget install --id $selectedApp.Id --silent --accept-source-agreements --accept-package-agreements
        Pause
    }
}

# Show category sub-menus
function Show-CategoryMenu {
    param (
        [Parameter(Mandatory)]
        [hashtable]$CategoryTable,
        [string]$Title = "CATEGORY SELECTOR"
    )

    do {
        Clear-Host
        Write-Host "=== $Title ===" -ForegroundColor Cyan

        $categories = @($CategoryTable.Keys)
        
        for ($i = 0; $i -lt $categories.Count; $i++) {
            Write-Host "[$($i + 1)] $($categories[$i])"
        }

        Write-Host "`n[0] Return to main menu" -ForegroundColor Yellow
        $userChoice = Read-Host "`nSelect a category"

        if ($userChoice -eq "0") { 
            return 
        }

        if ($userChoice -notmatch '^\d+$') {
            Write-Host "Invalid option. Please enter a number." -ForegroundColor Red
            Pause
        }

        $selectedIndex = [int]$userChoice - 1
        
        if ($selectedIndex -lt 0 -or $selectedIndex -ge $categories.Count) {
            Write-Host "Invalid category number. Please try again." -ForegroundColor Red
            Pause
        }

        $selectedCategory = $categories[$selectedIndex]
        Show-AppMenu -AppList $CategoryTable[$selectedCategory] -Title $selectedCategory
        
    } while ($true)
}

# https://github.com/massgravel/Microsoft-Activation-Scripts
function Invoke-ActivationTool {
    Write-Host "`nExecuting external script - Microsoft Activation Scripts..." -ForegroundColor Yellow
    Invoke-RestMethod https://get.activated.win | Invoke-Expression
}

# https://github.com/Raphire/Win11Debloat
function Invoke-Win11Debloat {
    Write-Host "`nExecuting external script - Win11Debloat..." -ForegroundColor Yellow
    & ([scriptblock]::Create((Invoke-RestMethod "https://debloat.raphi.re/")))
}

# Office Deployment Tool (ODT) Installation
function Install-OfficeWithODT {
    Write-Host "`n===== Office Deployment Tool Installation =====" -ForegroundColor Cyan
    
    $odtFolder = Join-Path $PSScriptRoot "ODT"
    $setupPath = Join-Path $odtFolder "setup.exe"
    $configPath = Join-Path $odtFolder "configuration.xml"
    
    # Check if setup.exe exists
    if (-not (Test-Path $setupPath)) {
        Write-Host "Office Deployment Tool (setup.exe) not found in ODT folder." -ForegroundColor Red
        Write-Host "Expected location: $setupPath" -ForegroundColor Yellow
        Pause
        return
    }
    
    # Check if configuration.xml exists
    if (-not (Test-Path $configPath)) {
        Write-Host "Configuration.xml not found in ODT folder." -ForegroundColor Red
        Write-Host "Expected location: $configPath" -ForegroundColor Yellow
        Write-Host "Creating a default configuration file..." -ForegroundColor Yellow
        
        # Create default configuration
        $defaultConfig = @"
<Configuration>
  <Add OfficeClientEdition="64" Channel="Current">
    <Product ID="Word2024Retail">
      <Language ID="es-mx" />
    </Product>
    <Product ID="PowerPoint2024Retail">
      <Language ID="es-mx" />
    </Product>
    <Product ID="Excel2024Retail">
      <Language ID="es-mx" />
    </Product>
  </Add>
</Configuration>
"@
        $defaultConfig | Out-File -FilePath $configPath -Encoding UTF8
        Write-Host "Default configuration created at: $configPath" -ForegroundColor Green
    }
    
    Write-Host "`nOffice Deployment Tool found at: $setupPath" -ForegroundColor Green
    Write-Host "Configuration file found at: $configPath" -ForegroundColor Green
    
    # Display configuration content
    Write-Host "`nConfiguration content:" -ForegroundColor Cyan
    Get-Content $configPath | ForEach-Object { Write-Host "  $_" -ForegroundColor White }
    
    $confirm = Read-Host "`nDo you want to proceed with Office installation using ODT? (Y/N)"
    
    if ($confirm -notmatch '^(Y|y)$') {
        Write-Host "Office installation cancelled." -ForegroundColor Red
        Pause
        return
    }
    
    try {
        Write-Host "`nStarting Office installation with ODT..." -ForegroundColor Yellow
        Write-Host "This may take several minutes depending on your internet connection..." -ForegroundColor Yellow
        
        # Execute ODT with configuration
        $process = Start-Process -FilePath $setupPath -ArgumentList "/configure", "`"$configPath`"" -Wait -PassThru -NoNewWindow
        
        if ($process.ExitCode -ne 0) {
            Write-Host "`nOffice installation completed with exit code: $($process.ExitCode)" -ForegroundColor Yellow
            Write-Host "Please check the installation logs for more details." -ForegroundColor Yellow
            return
        }
        
        Write-Host "`nOffice installation completed successfully!" -ForegroundColor Green
    }
    catch {
        Write-Host "`nError during Office installation: $($_.Exception.Message)" -ForegroundColor Red
    }
    
    Write-Host "`nOffice Deployment Tool installation process completed." -ForegroundColor Green
    Pause
}

function Install-WindowsUpdates {
	Write-Host "`nRunning Windows Update..." -ForegroundColor Yellow
	
	# Windows Update Module
    Install-Module -Name PSWindowsUpdate -Force

	# Get all Updates
	Get-WindowsUpdate -Confirm -AcceptAll

	# Install all updates
	Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -Confirm -IgnoreReboot
}

function WindowsUpdate {
    do {
        Clear-Host
        Write-Host "===== Windows Update Control =====" -ForegroundColor Cyan
        Write-Host "[1] Completely Disabling Windows Update" -ForegroundColor DarkRed
        Write-Host "[2] Enable Windows Update" -ForegroundColor Green
        Write-Host "[3] Check Current Status" -ForegroundColor Yellow
        Write-Host "[0] Back to Main Menu" -ForegroundColor Yellow
        
        $choice = Read-Host "`nSelect an option"
        
        switch ($choice) {
            "1" { 
                Write-Host "`nCompletely Disabling Windows Update..." -ForegroundColor DarkRed
                Write-Host "This will use the most aggressive methods possible to disable Windows Update" -ForegroundColor Red
                Write-Host "WARNING: This may affect other Windows services and features!" -ForegroundColor Yellow
                $confirm = Read-Host "`nAre you absolutely sure you want to proceed? Type 'YES' to confirm"
                
                if ($confirm -eq "YES") {
                    try {
                        Write-Host "`nExecuting complete Windows Update disable..." -ForegroundColor DarkRed
                        
                        # Disable ALL related services aggressively
                        $allServices = @("wuauserv", "bits", "cryptSvc", "DoSvc", "UsoSvc", "WaaSMedicSvc", "wisvc")
                        foreach ($service in $allServices) {
                            if (Get-Service -Name $service -ErrorAction SilentlyContinue) {
                                # Force stop multiple times
                                for ($i = 1; $i -le 10; $i++) {
                                    Stop-Service -Name $service -Force -ErrorAction SilentlyContinue
                                }
                                # Set to disabled and prevent restart
                                Set-Service -Name $service -StartupType Disabled -ErrorAction SilentlyContinue
                                Write-Host "Service $service stopped and disabled" -ForegroundColor Green
                            }
                        }
                        
                        # Disable scheduled tasks
                        Write-Host "`nDisabling Windows Update scheduled tasks..." -ForegroundColor Yellow
                        $tasks = @(
                            "\Microsoft\Windows\WindowsUpdate\Automatic App Update",
                            "\Microsoft\Windows\WindowsUpdate\Automatic App Update (RAC)",
                            "\Microsoft\Windows\WindowsUpdate\Scheduled Start",
                            "\Microsoft\Windows\WindowsUpdate\sih",
                            "\Microsoft\Windows\WindowsUpdate\sihboot",
                            "\Microsoft\Windows\WindowsUpdate\UpdateModelTask",
                            "\Microsoft\Windows\WindowsUpdate\UpdateOrchestrator\Schedule Scan",
                            "\Microsoft\Windows\WindowsUpdate\UpdateOrchestrator\Schedule Scan Static Task",
                            "\Microsoft\Windows\WindowsUpdate\UpdateOrchestrator\Schedule Scan User Task",
                            "\Microsoft\Windows\WindowsUpdate\UpdateOrchestrator\UpdateModelTask",
                            "\Microsoft\Windows\WindowsUpdate\UpdateOrchestrator\USO_UxBroker"
                        )
                        
                        foreach ($task in $tasks) {
                            try {
                                Disable-ScheduledTask -TaskName $task -ErrorAction SilentlyContinue
                                Write-Host "Task disabled: $task" -ForegroundColor Green
                            } catch {
                                Write-Host "Task not found: $task" -ForegroundColor Yellow
                            }
                        }
                        
                        # Create firewall rules to block Windows Update
                        Write-Host "`nCreating firewall rules to block Windows Update..." -ForegroundColor Yellow
                        try {
                            New-NetFirewallRule -DisplayName "Block Windows Update" -Direction Outbound -Action Block -Program "C:\Windows\System32\wuauserv.exe" -ErrorAction SilentlyContinue
                            New-NetFirewallRule -DisplayName "Block Windows Update URLs" -Direction Outbound -Action Block -RemoteAddress "*.update.microsoft.com", "*.windowsupdate.com", "*.microsoft.com" -ErrorAction SilentlyContinue
                            Write-Host "Firewall rules created" -ForegroundColor Green
                        } catch {
                            Write-Host "Firewall rules may already exist" -ForegroundColor Yellow
                        }
                        
                        # Additional aggressive registry modifications
                        $nuclearPaths = @(
                            "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AU\DetectionFrequency",
                            "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AU\NoAutoRebootWithLoggedOnUsers",
                            "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AU\NoAutoRebootWithLoggedOnUsers",
                            "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AU\RebootRelaunchTimeout",
                            "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AU\RebootWarningTimeout",
                            "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AU\RescheduleWaitTime",
                            "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AU\ScheduledInstallDay",
                            "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AU\ScheduledInstallTime"
                        )
                        
                        foreach ($path in $nuclearPaths) {
                            if (-not (Test-Path $path)) {
                                New-Item -Path $path -Force | Out-Null
                            }
                        }
                        
                        # Set ALL registry values to disable
                        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AU\DetectionFrequency" -Name "DetectionFrequencyEnabled" -Value 0 -ErrorAction Stop
                        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AU\NoAutoRebootWithLoggedOnUsers" -Name "NoAutoRebootWithLoggedOnUsers" -Value 1 -ErrorAction Stop
                        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AU\RebootRelaunchTimeout" -Name "RebootRelaunchTimeout" -Value 0 -ErrorAction Stop
                        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AU\RebootWarningTimeout" -Name "RebootWarningTimeout" -Value 0 -ErrorAction Stop
                        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AU\RescheduleWaitTime" -Name "RescheduleWaitTime" -Value 0 -ErrorAction Stop
                        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AU\ScheduledInstallDay" -Name "ScheduledInstallDay" -Value 0 -ErrorAction Stop
                        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AU\ScheduledInstallTime" -Name "ScheduledInstallTime" -Value 0 -ErrorAction Stop
                        
                        # Force registry values to stay disabled
                        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" -Name "AUOptions" -Value 1 -ErrorAction Stop
                        Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "AUOptions" -Value 1 -ErrorAction Stop
                        Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoUpdate" -Value 1 -ErrorAction Stop
                        
                        Write-Host "`nWindows Update has been completely disabled!" -ForegroundColor Green
                        Write-Host "All services stopped and disabled" -ForegroundColor Green
                        Write-Host "Scheduled tasks disabled" -ForegroundColor Green
                        Write-Host "Firewall rules created" -ForegroundColor Green
                        Write-Host "Registry completely modified" -ForegroundColor Green
                        Write-Host "CRITICAL: Restart your computer NOW!" -ForegroundColor Red
                        Write-Host "After restart, Windows Update should be completely disabled!" -ForegroundColor Yellow
                    }
                    catch {
                        Write-Host "Error disabling Windows Update: $($_.Exception.Message)" -ForegroundColor Red
                    }
                } else {
                    Write-Host "Windows Update disable cancelled." -ForegroundColor Yellow
                }
                Pause
            }
            "2" { 
                Write-Host "`nEnabling Windows Update..." -ForegroundColor Green
                try {
                    # Enable Windows Update services - MORE AGGRESSIVE
                    $services = @("wuauserv", "bits", "cryptSvc", "DoSvc", "UsoSvc", "WaaSMedicSvc", "wisvc")
                    foreach ($service in $services) {
                        if (Get-Service -Name $service -ErrorAction SilentlyContinue) {
                            Set-Service -Name $service -StartupType Automatic -ErrorAction SilentlyContinue
                            Start-Service -Name $service -ErrorAction SilentlyContinue
                            Write-Host "Service $service enabled and started" -ForegroundColor Green
                        }
                    }
                    
                    # Re-enable scheduled tasks
                    Write-Host "`nRe-enabling Windows Update scheduled tasks..." -ForegroundColor Yellow
                    $tasks = @(
                        "\Microsoft\Windows\WindowsUpdate\Automatic App Update",
                        "\Microsoft\Windows\WindowsUpdate\Automatic App Update (RAC)",
                        "\Microsoft\Windows\WindowsUpdate\Scheduled Start",
                        "\Microsoft\Windows\WindowsUpdate\sih",
                        "\Microsoft\Windows\WindowsUpdate\sihboot",
                        "\Microsoft\Windows\WindowsUpdate\UpdateModelTask",
                        "\Microsoft\Windows\WindowsUpdate\UpdateOrchestrator\Schedule Scan",
                        "\Microsoft\Windows\WindowsUpdate\UpdateOrchestrator\Schedule Scan Static Task",
                        "\Microsoft\Windows\WindowsUpdate\UpdateOrchestrator\Schedule Scan User Task",
                        "\Microsoft\Windows\WindowsUpdate\UpdateOrchestrator\UpdateModelTask",
                        "\Microsoft\Windows\WindowsUpdate\UpdateOrchestrator\USO_UxBroker"
                    )
                    
                    foreach ($task in $tasks) {
                        try {
                            Enable-ScheduledTask -TaskName $task -ErrorAction SilentlyContinue
                            Write-Host "Task enabled: $task" -ForegroundColor Green
                        } catch {
                            Write-Host "Task not found: $task" -ForegroundColor Yellow
                        }
                    }
                    
                    # Remove firewall rules that block Windows Update
                    Write-Host "`nRemoving firewall rules that block Windows Update..." -ForegroundColor Yellow
                    try {
                        Remove-NetFirewallRule -DisplayName "Block Windows Update" -ErrorAction SilentlyContinue
                        Remove-NetFirewallRule -DisplayName "Block Windows Update URLs" -ErrorAction SilentlyContinue
                        Write-Host "Firewall rules removed" -ForegroundColor Green
                    } catch {
                        Write-Host "Firewall rules may not exist" -ForegroundColor Yellow
                    }
                    
                    # Enable Windows Update through registry - ALL LOCATIONS
                    Write-Host "`nRestoring registry settings..." -ForegroundColor Yellow
                    
                    # Main Windows Update registry
                    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" -Name "AUOptions" -Value 3 -ErrorAction Stop
                    
                    # Policy registry
                    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoUpdate" -Value 0 -ErrorAction Stop
                    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "AUOptions" -Value 3 -ErrorAction Stop
                    
                    # Enable Delivery Optimization
                    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" -Name "DODownloadMode" -Value 1 -ErrorAction Stop
                    
                    # Restore all AU registry values
                    $auPaths = @(
                        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AU\DetectionFrequency",
                        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AU\NoAutoRebootWithLoggedOnUsers",
                        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AU\RebootRelaunchTimeout",
                        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AU\RebootWarningTimeout",
                        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AU\RescheduleWaitTime",
                        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AU\ScheduledInstallDay",
                        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AU\ScheduledInstallTime"
                    )
                    
                    foreach ($path in $auPaths) {
                        if (Test-Path $path) {
                            try {
                                # Restore default values
                                if ($path -like "*DetectionFrequency*") {
                                    Set-ItemProperty -Path $path -Name "DetectionFrequencyEnabled" -Value 1 -ErrorAction SilentlyContinue
                                }
                                if ($path -like "*NoAutoRebootWithLoggedOnUsers*") {
                                    Set-ItemProperty -Path $path -Name "NoAutoRebootWithLoggedOnUsers" -Value 0 -ErrorAction SilentlyContinue
                                }
                                if ($path -like "*RebootRelaunchTimeout*") {
                                    Set-ItemProperty -Path $path -Name "RebootRelaunchTimeout" -Value 10 -ErrorAction SilentlyContinue
                                }
                                if ($path -like "*RebootWarningTimeout*") {
                                    Set-ItemProperty -Path $path -Name "RebootWarningTimeout" -Value 30 -ErrorAction SilentlyContinue
                                }
                                if ($path -like "*RescheduleWaitTime*") {
                                    Set-ItemProperty -Path $path -Name "RescheduleWaitTime" -Value 10 -ErrorAction SilentlyContinue
                                }
                                if ($path -like "*ScheduledInstallDay*") {
                                    Set-ItemProperty -Path $path -Name "ScheduledInstallDay" -Value 0 -ErrorAction SilentlyContinue
                                }
                                if ($path -like "*ScheduledInstallTime*") {
                                    Set-ItemProperty -Path $path -Name "ScheduledInstallTime" -Value 3 -ErrorAction SilentlyContinue
                                }
                            } catch {
                                Write-Host "Could not restore: $path" -ForegroundColor Yellow
                            }
                        }
                    }
                    
                    # Remove restrictive policies
                    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "DisableWindowsUpdateAccess" -ErrorAction SilentlyContinue
                    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "SetDisableUXWUAccess" -ErrorAction SilentlyContinue
                    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "DoNotConnectToWindowsUpdateInternetLocations" -ErrorAction SilentlyContinue
                    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "DoNotAllowUpdateDeferralPoliciesToTurnOffFeatureUpdates" -ErrorAction SilentlyContinue
                    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore" -Name "DisableOSUpgrade" -ErrorAction SilentlyContinue
                    
                    # Remove Explorer policy
                    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoWindowsUpdate" -ErrorAction SilentlyContinue
                    
                    Write-Host "`nWindows Update has been aggressively re-enabled!" -ForegroundColor Green
                    Write-Host "All services enabled and started" -ForegroundColor Green
                    Write-Host "Scheduled tasks re-enabled" -ForegroundColor Green
                    Write-Host "Firewall rules removed" -ForegroundColor Green
                    Write-Host "Registry completely restored" -ForegroundColor Green
                    Write-Host "IMPORTANT: Restart your computer for all changes to take full effect!" -ForegroundColor Yellow
                }
                catch {
                    Write-Host "Error enabling Windows Update: $($_.Exception.Message)" -ForegroundColor Red
                }
                Pause
            }
            "3" { 
                Write-Host "`nChecking Windows Update status..." -ForegroundColor Yellow
                try {
                    $service = Get-Service -Name "wuauserv" -ErrorAction Stop
                    $registry = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" -Name "AUOptions" -ErrorAction SilentlyContinue
                    $policyRegistry = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "AUOptions" -ErrorAction SilentlyContinue
                    
                    Write-Host "`nWindows Update Service Status:" -ForegroundColor Cyan
                    Write-Host "Service Name: $($service.Name)" -ForegroundColor White
                    Write-Host "Service Status: $($service.Status)" -ForegroundColor White
                    Write-Host "Startup Type: $($service.StartType)" -ForegroundColor White
                    
                    Write-Host "`nRegistry Settings:" -ForegroundColor Cyan
                    if ($registry) {
                        Write-Host "Main Registry AUOptions: $($registry.AUOptions)" -ForegroundColor White
                    }
                    if ($policyRegistry) {
                        Write-Host "Policy Registry AUOptions: $($policyRegistry.AUOptions)" -ForegroundColor White
                    }
                    
                    # Check additional services
                    $additionalServices = @("bits", "cryptSvc", "DoSvc")
                    Write-Host "`nAdditional Services Status:" -ForegroundColor Cyan
                    foreach ($svc in $additionalServices) {
                        $svcStatus = Get-Service -Name $svc -ErrorAction SilentlyContinue
                        if ($svcStatus) {
                            Write-Host "$svc : $($svcStatus.Status) ($($svcStatus.StartType))" -ForegroundColor White
                        }
                    }
                    
                    $auOptions = @{
                        1 = "Disabled"
                        2 = "Notify before download"
                        3 = "Automatically download and notify of installation"
                        4 = "Automatically download and schedule installation"
                    }
                    
                    if ($registry -and $auOptions.ContainsKey($registry.AUOptions)) {
                        Write-Host "`nCurrent Setting: $($auOptions[$registry.AUOptions])" -ForegroundColor White
                    }
                    
                    Write-Host "`nNote: AUOptions values:" -ForegroundColor Yellow
                    Write-Host "1 = Disabled" -ForegroundColor White
                    Write-Host "2 = Notify before download" -ForegroundColor White
                    Write-Host "3 = Automatically download and notify of installation" -ForegroundColor White
                    Write-Host "4 = Automatically download and schedule installation" -ForegroundColor White
                }
                catch {
                    Write-Host "Error checking Windows Update status: $($_.Exception.Message)" -ForegroundColor Red
                }
                Pause
            }
            "0" { 
                Write-Host "Returning to main menu..." -ForegroundColor Yellow
                return 
            }
            Default {
                Write-Host "Invalid option. Please try again." -ForegroundColor Red
                Pause
            }
        }
    } while ($true)
}

# Install apps from Apps folder
function Install-AppsFromFolder {
    $appsFolder = Join-Path $PSScriptRoot "Apps"
    
    if (-not (Test-Path $appsFolder)) {
        Write-Host "Apps folder not found at: $appsFolder" -ForegroundColor Red
        Pause
        return
    }
    
    $installerFiles = Get-ChildItem -Path $appsFolder -File | Where-Object { 
        $_.Extension -match '\.(exe|msi|msix|appx)$' 
    }
    
    if ($installerFiles.Count -eq 0) {
        Write-Host "No installer files found in Apps folder." -ForegroundColor Yellow
        Pause
        return
    }
    
    Write-Host "`nFound the following installers:" -ForegroundColor Cyan
    $installerFiles | ForEach-Object { Write-Host "- $($_.Name)" }
    
    $confirm = Read-Host "`nDo you want to install all apps from the Apps folder? (Y/N)"
    
    if ($confirm -notmatch '^(Y|y)$') {
        Write-Host "Apps installation cancelled." -ForegroundColor Red
        Pause
        return
    }
    
    foreach ($installer in $installerFiles) {
        Write-Host "`nInstalling $($installer.Name)..." -ForegroundColor Cyan
        
        try {
            $installerPath = $installer.FullName
            
            # Try silent installation for common installers
            switch ($installer.Extension.ToLower()) {
                ".exe" {
                    Start-Process -FilePath $installerPath -ArgumentList "/S", "/SILENT", "/VERYSILENT", "/NORESTART" -Wait -NoNewWindow
                }
                ".msi" {
                    # MSI silent installation
                    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i", "`"$installerPath`"", "/quiet", "/norestart" -Wait -NoNewWindow
                }
                ".msix" {
                    # MSIX installation
                    Add-AppxPackage -Path $installerPath -ForceApplicationShutdown
                }
                ".appx" {
                    # APPX installation
                    Add-AppxPackage -Path $installerPath -ForceApplicationShutdown
                }
                
                default {
                    Write-Host "Unsupported installer type: $($installer.Extension)" -ForegroundColor Yellow
                    continue
                }
            }
            
            Write-Host "Successfully installed: $($installer.Name)" -ForegroundColor Green
        }
        catch {
            Write-Host "Failed to install $($installer.Name): $($_.Exception.Message)" -ForegroundColor Red
        }
    }
    
    Write-Host "`nApps installation completed." -ForegroundColor Green
    Pause
}

function Pause {
    Read-Host -Prompt "`nPress Enter to continue..."
}

function Restart-System {
    $userChoice = Read-Host "`nDo you want to reboot the system? [Y] or [N]"
    
    if ($userChoice -notin 'y', 'Y') {
        Write-Host "`nReboot cancelled by user." -ForegroundColor Yellow
        Pause
        return
    }

    Write-Host "Rebooting the system..." -ForegroundColor Yellow
    Start-Sleep -Seconds 2
    Restart-Computer
}

function Test-AdminPrivileges {
    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    $isAdmin = New-Object Security.Principal.WindowsPrincipal($currentUser)
    return $isAdmin.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function Get-Winget {
    $userChoice = Read-Host "`nDo you want to automatically install winget from the Github repository? [Y/N]"
    
    if ($userChoice.ToLower() -notin 'y', 'yes') {
        Write-Host "This script requires winget to function properly." -ForegroundColor Red
        exit
    }

    $installerUrl = "https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
    $path = "$env:TEMP\winget.msixbundle"

    try {
        Write-Host "Downloading winget from GitHub..." -ForegroundColor Cyan
        Invoke-WebRequest -Uri $installerUrl -OutFile $path -UseBasicParsing

        Write-Host "Installing winget..." -ForegroundColor Cyan
        Add-AppxPackage -Path $path

        Write-Host "Winget installation complete." -ForegroundColor Green
        Pause
    } catch {
        Write-Host "> Failed to install winget: $($_.Exception.Message)" -ForegroundColor Red
        Pause
        exit
    }
}

# Main loop
$loop = $true
do {
    
    # Check if running as administrator
    if (-not (Test-AdminPrivileges)) {
        Write-Host "`n> This script requires administrator privileges to run properly." -ForegroundColor Red
        Write-Host "> Please run PowerShell as Administrator and try again." -ForegroundColor Yellow
        Write-Host "> Right-click on PowerShell and select 'Run as Administrator'" -ForegroundColor Cyan
        Pause
        exit
    }
    
    if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
        Write-Host "`n> Winget is not installed on this system." -ForegroundColor Red
        Write-Host "> You can download it manually from Microsoft Store or Github repository:" -ForegroundColor Yellow
        Write-Host "  https://github.com/microsoft/winget-cli" -ForegroundColor Cyan
        Get-Winget
    }

    Show-Menu
    $option = Read-Host "`nSelect an option"

    switch ($option) {
        "1" { InstallBasicApps }
        "2" { Install-AppsFromFolder }
        "3" { Install-OfficeWithODT }
        "4" { Invoke-ActivationTool }
        "5" { Show-AppMenu -AppList $WingetBrowserList -Title "Browser Apps" }
        "6" { Show-AppMenu -AppList $WingetCodingList -Title "Coding & IDE Apps" }
        "7" { Show-AppMenu -AppList $WingetGamingList -Title "Gaming Apps" }
        "8" { Show-AppMenu -AppList $WingetHardwareList -Title "Hardware Monitoring Apps" }
        "9" { Show-CategoryMenu -CategoryTable $MediaCategories -Title "Media Apps" }
        "10" { Show-AppMenu -AppList $WingetScreenList -Title "Recording, Screenshots & Meetings Apps" }
        "11" { Show-AppMenu -AppList $WingetSecurityList -Title "Security and Privacy Apps" }
        "12" { Show-AppMenu -AppList $WingetOfficeList -Title "Office and PDF Applications" }
        "U" { WindowsUpdate }
        "L" { Install-WindowsUpdates }
        "D" { Invoke-Win11Debloat }
        "R" { Restart-System }
        "x" {
            Write-Host "Exit" -ForegroundColor Yellow
            $loop = $false
        }
        Default {
            Write-Host "Invalid option. Please try again." -ForegroundColor Red
            Pause
        }
    }
} while ($loop)
