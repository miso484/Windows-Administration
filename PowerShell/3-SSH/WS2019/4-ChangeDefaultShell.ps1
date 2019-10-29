# make sure the PATH of powershell command
Get-Command powershell | Format-Table -AutoSize -Wrap 

$Value = Get-Command powershell | Select-Object -First 1 -ExpandProperty Source

# set DefaultShell=PowerShell in registry entry of OpenSSH
# for the PATH of PowerShell, specify the result of above
New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "$Value" -PropertyType String -Force 