function Show-Menu {
    Clear-Host
    Write-Host "===== Windows Post Install =====" -ForegroundColor Cyan
    Write-Host "[1] Basic Apps Installation"
    Write-Host "[2] Download Office Tool Plus - https://github.com/YerongAI/Office-Tool" -ForegroundColor Yellow
    Write-Host "[3] Microsoft Activation Script - https://massgrave.dev/" -ForegroundColor Yellow
    Write-Host
    Write-Host "===== Install Others Apps =====" -ForegroundColor Cyan
    Write-Host "[4] Browsers"
    Write-Host "[5] Coding and IDEs"
    Write-Host "[6] Gaming"
    Write-Host "[7] Hardware Monitoring"
    Write-Host "[8] Music and Video Players"
    Write-Host "[9] Recording, Screenshots and Meetings"
    Write-Host "[10] Security and Privacy (VPNs)"
    Write-Host
    Write-Host "===== Optimization Tools =====" -ForegroundColor Cyan
    # Write-Host "[U] Enable / Disable Windows Update"
    Write-Host "[D] Win11 Debloat - https://github.com/Raphire/Win11Debloat " -ForegroundColor Yellow
    Write-Host
    Write-Host "[X] Exit" -ForegroundColor Yellow
    Write-Host "[R] Restart system" -ForegroundColor Yellow
}

# Basic installation apps 
$WingetBasicList = @(
    "Adobe.Acrobat.Reader.64-bit",
    "Google.Chrome",
    # "Microsoft.Office", # Microsoft 365 Enterprise en-us
    "RARLab.WinRAR",
    "Microsoft.WindowsTerminal"
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

    foreach ($app in $WingetBasicList) {
        Write-Host "`nInstalling $app...`n" -ForegroundColor Cyan
        try {
            winget install --accept-package-agreements --accept-source-agreements --id $app -e -h
        } catch {
            Write-Host "Failed to install $app :`n$($_.Exception.Message)" -ForegroundColor Red
        }
    }
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
    @{ Name = "DBeaver"; Id = "DBeaver.DBeaver" },
    @{ Name = "Docker Desktop"; Id = "Docker.DockerDesktop" },
    @{ Name = "Git Bash (Git for Windows)"; Id = "Git.Git" },
    @{ Name = "GitHub Desktop"; Id = "GitHub.GitHubDesktop" },
    @{ Name = "MySQL Workbench"; Id = "Oracle.MySQLWorkbench" },
    @{ Name = "NeoVim"; Id = "Neovim.Neovim" },
    @{ Name = "NetBeans IDE"; Id = "Apache.NetBeans" },
    @{ Name = "Node.js LTS"; Id = "OpenJS.NodeJS.LTS" },
    @{ Name = "Notepad++"; Id = "Notepad++.Notepad++" },
    @{ Name = "Postman"; Id = "Postman.Postman" },
    @{ Name = "Python 3"; Id = "Python.Python.3" },
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

# https://github.com/YerongAI/Office-Tool
function Get-OfficeTools {
    Write-Host "`Executing external script - Office Tools..." -ForegroundColor Yellow
    Start-Process powershell.exe -ArgumentList '-NoExit', '-Command', 'Invoke-RestMethod https://officetool.plus | Invoke-Expression;'
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

function Check-AdminPrivileges {
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
    if (-not (Check-AdminPrivileges)) {
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
        "2" { Get-OfficeTools }
        "3" { Invoke-ActivationTool }
        "4" { Show-AppMenu -AppList $WingetBrowserList -Title "Browser Apps" }
        "5" { Show-AppMenu -AppList $WingetCodingList -Title "Coding & IDE Apps" }
        "6" { Show-AppMenu -AppList $WingetGamingList -Title "Gaming Apps" }
        "7" { Show-AppMenu -AppList $WingetHardwareList -Title "Hardware Monitoring Apps" }
        "8" { Show-CategoryMenu -CategoryTable $MediaCategories -Title "Media Apps" }
        "9" { Show-AppMenu -AppList $WingetScreenList -Title "Recording, Screenshots & Meetings Apps" }
        "10" { Show-AppMenu -AppList $WingetSecurityList -Title "Security and Privacy Apps" }
        # "U" { WindowsUpdate }
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
