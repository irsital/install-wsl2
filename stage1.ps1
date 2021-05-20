Write-Host "This script is based on the steps from:"
Write-Host "https://docs.microsoft.com/en-us/windows/wsl/install-win10#manual-installation-steps"

$Global:MinWinVer=1903
$Global:MinBuildVer=18362

# It makes more sense to first check the requirements before enabling WSL
Write-Host "Step 1 - Check requirements for running WSL 2"
$info=(Get-ComputerInfo  | Select-Object WindowsVersion, OsBuildnumber)

If ([int]$info.WindowsVersion -ge $Global:MinWinVer ) {
    "OK. Windows Version {0} >= {1}" -f $info.WindowsVersion, $Global:MinWinVer
    If ([int]$info.OsBuildnumber -ge $Global:MinBuildVer ) {
        "OK. Windows Build Number {0} >= {1}" -f $info.OsBuildnumber, $Global:MinBuildVer
    } Else {
        "Error. Windows Build Number is: {0}, but should be >= {1} to install WSL2" -f $info.OsBuildnumber, $Global:MinBuildVer
        Exit
    }
} Else {
    "Error. Windows Version is: {0}, but should be >= {1} to install WSL2" -f $info.WindowsVersion, $Global:MinWinVer
    Exit
}

Write-Host "Step 2 - Enable the Windows Subsystem for Linux"
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

Write-Host "Step 3 - Enable Virtual Machine feature"
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

Write-Host "Step 4 - Save your work and restart the machine"
