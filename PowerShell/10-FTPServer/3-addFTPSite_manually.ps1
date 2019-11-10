# Add FTP Site to use FTP file transfer from Client computers.

#
## For example, Configure FTP site to create a local group [FTPGroup] and add local users you allow to use FTP to the group, and also grant read and write authority to the group.
#

# add a group [FTPGroup] for FTP
New-LocalGroup -Name "FTPGroup" 

# add users to the [FTPGroup] you allow to use FTP
# add [Serverworld] user to [FTPGroup] as an example below
Add-LocalGroupMember -Group "FTPGroup" -Member "Serverworld" 

# confirm
Get-LocalGroupMember -Name "FTPGroup"

# add FTP site
# -Name [any name you like]
# -IPAddress [listening IP address] (below is 0.0.0.0 (all))
# -Port [listening port]
New-WebFtpSite -Name "FTPSite01" -IPAddress "*" -Port 21 

# set physical folder that is used for FTP site
# example below, create a [FTPSite01] folder under the [C:\inetpub\ftproot] that is created by default and set it
mkdir 'C:\inetpub\ftproot\FTPSite01' 
Set-ItemProperty "IIS:\Sites\FTPSite01" -Name physicalPath -Value 'C:\inetpub\ftproot\FTPSite01'

# allow no SSL/TLS connection
Set-ItemProperty "IIS:\Sites\FTPSite01" -Name ftpServer.security.ssl.controlChannelPolicy -Value "SslAllow"
Set-ItemProperty "IIS:\Sites\FTPSite01" -Name ftpServer.security.ssl.dataChannelPolicy -Value "SslAllow" 

# set basic authentication
Set-ItemProperty "IIS:\Sites\FTPSite01" -Name ftpServer.security.authentication.basicAuthentication.enabled -Value $true 

# set read and write authority to [FTPGroup] group
Add-WebConfiguration "/system.ftpServer/security/authorization" -Location FTPSite01 -PSPath IIS:\ -Value @{accessType="Allow";roles="FTPGroup";permissions="Read,Write"}

# set external IP address (the one client computers can connect)
Set-ItemProperty "IIS:\Sites\FTPSite01" -Name ftpServer.firewallSupport.externalIp4Address -Value "10.0.0.101"

# set NTFS access authority to the physical folder
# example below, add full control
icacls "C:\inetpub\ftproot\FTPSite01" /grant "FTPGroup:(OI)(CI)(F)"

# restart FTP site
Restart-WebItem -PSPath 'IIS:\Sites\FTPSite01'

