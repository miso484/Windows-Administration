# Configure WebDAV Setting to use File sharing over HTTP.

# First enable SSL or TLS (refer to 5-SSLAndTLS.ps1 file)

# On this example, Configure settings that set a virtual directory under a Web Site and set WebDAV to the directory. And also create a local group [DavGroup] to allow read and write permission for them to WebDAV directory.

# install WebDAV feature
Install-WindowsFeature Web-DAV-Publishing

# restart IIS
Restart-Service W3SVC 

# create a group [DavGroup]
New-LocalGroup -Name "DavGroup"

# add a user to [DavGroup] group
# (the user you allow to access to WebDAV directory)
Add-LocalGroupMember -Group "DavGroup" -Member "Serverworld" 

Get-Website

# create [webdav] folder
mkdir C:\inetpub\webdav

# set [webdav] folder as a virtual directory on IIS
New-WebVirtualDirectory -Site "RX-7.srv.world" -Name "webdav" -PhysicalPath "C:\inetpub\webdav"

# enable WebDAV feature
Set-WebConfigurationProperty -Filter '/system.webServer/webdav/authoring' -Location "RX-7.srv.world" -Name enabled -Value True

# disable anonymous authentication on [webdav] folder
Set-WebConfigurationProperty -Filter '/system.webServer/security/authentication/anonymousAuthentication' -Location "RX-7.srv.world/webdav" -Name enabled -Value False

# enable basic authentication on [webdav] folder
Set-WebConfigurationProperty -Filter '/system.webServer/security/authentication/basicAuthentication' -Location "RX-7.srv.world/webdav" -Name enabled -Value True

# allow Read,Write,Source persmission to [webdav] folder for [DavGroup] group
Add-WebConfiguration -Filter "/system.webServer/webdav/authoringRules" -Location "RX-7.srv.world/webdav" -Value @{path="*";roles="DavGroup";access="Read,Write,Source"}

# allow full control NTFS permission to [webdav] folder for [DavGroup] group
icacls "C:\inetpub\webdav" /grant "DavGroup:(OI)(CI)(F)"

# enable [Directory Browsing] to  [webdav] folder
Set-WebConfigurationProperty -Filter '/system.webServer/directoryBrowse' -Location "RX-8.srv.world/webdav" -Name enabled -Value True

# restart target Web site
Restart-WebItem -PSPath 'IIS:\Sites\RX-7.srv.world'

# verify accesse ⇒ [-u (username)]
curl.exe -u Serverworld https://rx-7.srv.world/webdav/
