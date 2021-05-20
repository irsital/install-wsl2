# Install WSL2
These scripts enable WSL2 on Windows and downloads/installs Debian without the need to interact with the Microsoft Store.

This is based on the instructions provided here: https://docs.microsoft.com/en-us/windows/wsl/install-win10#manual-installation-steps

## How to use:
* Open a `PowerShell`-terminal, and run `stage1`:
    ```
    iwr https://raw.githubusercontent.com/irsital/install-wsl2/main/stage1.ps1 | iex
    ```
* ***Restart machine***
* Open a `PowerShell`-terminal, and now run `stage2`:
    ```
    iwr https://raw.githubusercontent.com/irsital/install-wsl2/main/stage2.ps1 | iex
    ```

### Remarks
* There are 2 separate manual stages because on the provided machine it's not allowed to create a `Workflow` that does a `Register-ScheduledJob` to continue working after a restart.