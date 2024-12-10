# Shutdown the Virtual Machine

# Specify the VM Name
$vmName = "Practice Vitual Machine"

# Shut down the Virtual Machine gracefully
Stop-VM -Name $vmName -Force

Write-Host "Shutting down the virtual machine: $vmName"

# Identify and close the Hyper-V Manager application (specific MMC instance)
$processes = Get-Process -Name "mmc" -ErrorAction SilentlyContinue
foreach ($process in $processes) {
    if ($process.MainWindowTitle -like "*Hyper-V Manager*") {
        Stop-Process -Id $process.Id -Force -ErrorAction SilentlyContinue
        Write-Host "Closed Hyper-V Manager process with ID: $($process.Id)"
    }
}

Write-Host "Exiting the Hyper-V Manager application."