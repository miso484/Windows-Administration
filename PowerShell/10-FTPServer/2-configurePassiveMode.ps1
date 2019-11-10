# This example shows how to configure FTP Server with Passive Mode.

# set the port range you use for passive mode
# specify any range that FTP Server Host does not use
# example below sets 60000 - 60100 range
Set-WebConfiguration "/system.ftpServer/firewallSupport" -PSPath "IIS:\" -Value @{lowDataChannelPort="60000";highDataChannelPort="60100";} 

# confirm
Get-IISConfigSection -SectionPath "system.ftpServer/firewallSupport" 

#restart FTP Service
Restart-Service ftpsvc

# allow passive ports you set and also 21 port FTP Server uses on Windows firewall
New-NetFirewallRule `
-Name "FTP Server Port" `
-DisplayName "FTP Server Port" `
-Description 'Allow FTP Server Ports' `
-Profile Any `
-Direction Inbound `
-Action Allow `
-Protocol TCP `
-Program Any `
-LocalAddress Any `
-LocalPort 21,60000-60100 
