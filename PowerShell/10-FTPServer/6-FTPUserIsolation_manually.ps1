# Configure FTP User Isolation Setting.
# For this setting, each user can access only to their own named folder.
# If thete is no file share requirements among users, this setting is useful.

# add FTP site
# -Name [any name you like]
# -IPAddress [listening IP address] (below is 0.0.0.0 (all))
# -Port [listening port]
New-WebFtpSite -Name "FTPRoot" -IPAddress "*" -Port 21 

# set physical folder that is used for FTP site
# example below, create a [FTPSite01] folder under the [C:\inetpub\ftproot] that is created by default and set it
Set-ItemProperty "IIS:\Sites\FTPRoot" -Name physicalPath -Value 'C:\inetpub\ftproot'

# set SSL/TLS setting (example below is allowing No SSL)
Set-ItemProperty "IIS:\Sites\FTPRoot" -Name ftpServer.security.ssl.controlChannelPolicy -Value "SslAllow"
Set-ItemProperty "IIS:\Sites\FTPRoot" -Name ftpServer.security.ssl.dataChannelPolicy -Value "SslAllow" 

# set basic authentication
Set-ItemProperty "IIS:\Sites\FTPRoot" -Name ftpServer.security.authentication.basicAuthentication.enabled -Value $true

# set read and write authority to all local users
Add-WebConfiguration "/system.ftpServer/security/authorization" -Location FTPRoot -PSPath IIS:\ -Value @{accessType="Allow";users="*";permissions="Read,Write"}

# set user isolation
Set-ItemProperty "IIS:\Sites\FTPRoot" -Name ftpServer.userIsolation.mode -Value "IsolateRootDirectoryOnly"

# set external IP address (the one client computers can connect)
Set-ItemProperty "IIS:\Sites\FTPRoot" -Name ftpServer.firewallSupport.externalIp4Address -Value "10.0.0.101"

# create the [LocalUser] folder under the Path you set as physical path of FTP site (it is needed on this setting)
# if Domain users, create [(FTP root)\(%UserDomain%)]
mkdir C:\inetpub\ftproot\LocalUser

# restart FTP site
Restart-WebItem -PSPath 'IIS:\Sites\FTPRoot'

# create folders for each local user that each folder name is the same with thier username
# naming rule ⇒ [(FTP root)\LocalUser\(Username)] (example below is for [Serverworld] user)
mkdir C:\inetpub\ftproot\LocalUser\Serverworld
icacls "C:\inetpub\ftproot\LocalUser\Serverworld" /grant "Serverworld:(OI)(CI)(F)"