# DeviceDefender
DeviceDefender is a PowerShell script that allows you to whitelist or blacklist connected devices on a Windows computer. With this script, you can prevent unauthorized devices from being connected to your computer, or allow only specific devices to be connected.
## Installation

To use DeviceDefender, you'll need to have PowerShell installed on your Windows computer. The script can be downloaded from the GitHub repository and run from the command line.
## Usage

To use DeviceDefender, simply open PowerShell and run the script with the appropriate parameters:
```
bash

### Whitelist all connected devices except for storage devices
.\DeviceDefender.ps1 -Whitelist

### Blacklist all connected storage devices except for keyboard and mouse
.\DeviceDefender.ps1 -Blacklist

```
You can also modify the script to fit your specific needs, such as adding additional device classes to the whitelist or blacklist.
## License

DeviceDefender is licensed under the MIT License. See the LICENSE file for more information.
## Disclaimer

DeviceDefender is provided as-is and is not intended for use in a production environment. Use at your own risk.

