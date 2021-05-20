Write-Host "This script is based on the steps from:"
Write-Host "https://docs.microsoft.com/en-us/windows/wsl/install-win10#manual-installation-steps"

Write-Host "Step 5 - Download the Linux kernel update package"
$wsl_installer = "wsl_update_x64.msi"
Invoke-WebRequest -Uri https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi -OutFile $wsl_installer -UseBasicParsing

Write-Host "Install "$wsl_installer
$MSIArguments = @(
    "/i"
    ($wsl_installer -f $file.fullname)
    "/qn"
    "/norestart"
)
Start-Process "msiexec.exe" -ArgumentList $MSIArguments -Wait -NoNewWindow 

Write-Host "Step 6 - Set WSL 2 as your default version"
wsl --set-default-version 2

Write-Host "Step 7 - Install your Linux distribution of choice"
Write-Host "Downloading Debian..."
Invoke-WebRequest -Uri https://aka.ms/wsl-debian-gnulinux -OutFile Debian.appx -UseBasicParsing
Write-Host "Done."
Write-Host "Installing Debian app"
Add-AppxPackage .\Debian.appx

Write-Host "Step 8 - Open the WSL2 (Debian) terminal"
wsl.exe -d Debian
