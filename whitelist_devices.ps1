# Function to whitelist connected devices and blacklist disconnected devices except for the keyboard and mouse
function Whitelist-ConnectedDevices {
    # Get a list of all devices
    $devices = Get-PnpDevice -PresentOnly

    # Initialize variables for the whitelist and blacklist
    $whitelist = @()
    $blacklist = @()

    # Loop through each device
    foreach ($device in $devices) {
        # Check if the device is a storage device
        if ($device.ClassGuid -eq "{4d36e967-e325-11ce-bfc1-08002be10318}") {
            # Check if the device is connected
            if ($device.Status -eq "OK") {
                # Add the device to the whitelist
                $whitelist += $device.InstanceId
            }
            else {
                # Check if the device is a keyboard or mouse
                if ($device.ClassGuid -eq "{4d36e96b-e325-11ce-bfc1-08002be10318}" -or $device.ClassGuid -eq "{4d36e96f-e325-11ce-bfc1-08002be10318}") {
                    # Add the device to the whitelist
                    $whitelist += $device.InstanceId
                }
                else {
                    # Add the device to the blacklist
                    $blacklist += $device.InstanceId
                }
            }
        }
    }

    # Whitelist all devices in the whitelist
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions" -Name "AllowDeviceIDs" -Value $whitelist -Type MultiString | Out-Null

    # Blacklist all devices in the blacklist
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions" -Name "DenyDeviceIDs" -Value $blacklist -Type MultiString | Out-Null

    # Display a success message
    Write-Host "All connected devices have been whitelisted and all disconnected storage devices have been blacklisted except for the keyboard and mouse."
}

# Function to whitelist all connected devices and blacklist all disconnected devices
function Whitelist-AllConnectedDevices {
    # Get a list of all devices
    $devices = Get-PnpDevice -PresentOnly

    # Initialize variables for the whitelist and blacklist
    $whitelist = @()
    $blacklist = @()

    # Loop through each device
    foreach ($device in $devices) {
        # Check if the device is a storage device
        if ($device.ClassGuid -eq "{4d36e967-e325-11ce-bfc1-08002be10318}") {
            # Check if the device is connected
            if ($device.Status -eq "OK") {
                # Add the device to the whitelist
                $whitelist += $device.InstanceId
            }
            else {
                # Add the device to the blacklist
                $blacklist += $device.InstanceId
            }
        }
        # Check if the device is a non-storage device
        else {
            # Add the device to the whitelist
            $whitelist += $device.InstanceId
        }
    }

    # Whitelist all devices in the whitelist
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions" -Name "AllowDeviceIDs" -Value $whitelist -Type MultiString | Out-Null

    # Blacklist all devices in the blacklist
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions" -Name "DenyDeviceIDs" -Value $blacklist -Type MultiString | Out-Null

    # Display a success message
    Write-Host "All connected devices have been whitelisted and all disconnected devices have been blacklisted except for the keyboard and mouse."
}

# Call the function to whitelist connected devices and blacklist disconnected devices except for the keyboard and mouse
Whitelist-ConnectedDevices
