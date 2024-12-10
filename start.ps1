# Specify the VM Name
$vmName = "Practice Vitual Machine"

# Start the Virtual Machine if it's not running
$vm = Get-VM -Name $vmName
if ($vm.State -ne 'Running') {
    Start-VM -Name $vmName
    Write-Host "Starting the virtual machine: $vmName"
} else {
    Write-Host "Virtual machine is already running: $vmName"
}

# Wait for the VM to fully start (you can adjust the time if necessary)
Start-Sleep -Seconds 5

# Connect to the Virtual Machine using vmconnect with & (call operator)
$vmConnectPath = "$env:SystemRoot\System32\vmconnect.exe"
$server = "localhost"   # The Hyper-V host
$vmName = "Practice Vitual Machine"  # The VM name

Write-Host "Connecting to the virtual machine: $vmName"

# Use the call operator to run the command
& "$vmConnectPath" $server $vmName

# Close the PowerShell window after the script is executed
Exit
