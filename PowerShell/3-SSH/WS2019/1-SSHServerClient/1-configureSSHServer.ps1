# get available name of OpenSSH
Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*' 

# Install OpenSSH Server
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

# set [Automatic] for Startup
Set-Service -Name "sshd" -StartupType Automatic

# start sshd service
Start-Service -Name "sshd"

# verify
Get-Service -Name "sshd" | Select-Object *

# if Windows Firewall is running, allow 22/TCP
New-NetFirewallRule -Name "SSH" `
-DisplayName "SSH" `
-Description "Allow SSH" `
-Profile Any `
-Direction Inbound `
-Action Allow `
-Protocol TCP `
-Program Any `
-LocalAddress Any `
-RemoteAddress Any `
-LocalPort 22 `
-RemotePort Any 