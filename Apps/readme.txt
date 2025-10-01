# Apps Folder - Supported Installers

This folder is used by the WPI script (option 2) to automatically install applications.

## Supported Installer Types:
- .exe - Executable installers (silent installation)
- .msi - Microsoft Installer packages (silent installation)
- .msix - Microsoft Store app packages
- .appx - Windows app packages

## Usage:
1. Place your installer files in this folder
2. Run wpi.ps1 and select option 2
3. The script will automatically detect and install all supported files

## Notes:
- All installations are performed silently
- Supported file types are automatically detected