# Windows Post Install and Optimization Tools
Windows Post-Install Script and optimization tools using PowerShell and [Winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/) (Windows Package Manager). Easily install applications after a fresh Windows setup.

## ✨ Features
- Install applications using [winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/) (Windows Package Manager).
- Download Office using [OfficeToolsPlus](https://github.com/YerongAI/Office-Tool)
- Activate Windows and Office using [Microsoft-Activation-Scripts](https://github.com/massgravel/Microsoft-Activation-Scripts)
- Windows Optimization tools using [Win11Debloat](https://github.com/Raphire/Win11Debloat)

## 📦 Requirements
- Windows 10 or 11
- PowerShell 5.1+
- `winget` CLI installed and configured

> ℹ️ Winget comes pre-installed on Windows 10 (v1809+) and Windows 11.

> ℹ️ Download winget from the Microsoft Store or from the official GitHub repository:  
> https://github.com/microsoft/winget-cli


## 🚀 How to Use
1. Download or clone this repository:

```
git clone https://github.com/h0ndv/windows-post-install.git
```

2. Open Powershell or Terminal as an adminstrator.
3. Run the script with PowerShell:

```
Set-ExecutionPolicy Bypass -Scope Process -Force
.\wip.ps1
```

4. Done

## 🛠️ Customization
You can easily add or remove apps in the lists defined in the script:

```
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
```

Each app entry requires:

Name: Display name in the menu

Id: Winget ID (use winget search to find it)


<img alt="wpi" width="800" src="https://i.imgur.com/leoEBt4.png">