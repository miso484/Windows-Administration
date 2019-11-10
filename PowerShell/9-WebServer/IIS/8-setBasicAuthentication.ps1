# Set Basic Authentication to a folder to require authentication for users.

# On Basic Authentication, username and password sends with plain text, so it should be configured SSL setting, too. Refer to here for SSL config.
# Refer to 5-SSLAndTLS.ps1 file

# On this example, Configure settings that create a [auth_basic] folder under the [RX-7.srv.world] site and set Basic Authentication to the Folder.

# install Basic Authentication feature
Install-WindowsFeature Web-Basic-Auth 

# restart IIS
Restart-Service W3SVC

Get-Website

# create [auth_basic] folder
New-Item -ItemType Directory -Path "IIS:\Sites\RX-7.srv.world\auth_basic"

# disable anonymous authentication for target folder
Set-WebConfigurationProperty -Filter '/system.webServer/security/authentication/anonymousAuthentication' -Location "RX-7.srv.world/auth_basic" -Name enabled -Value False 

# enable basic authentication for target folder
Set-WebConfigurationProperty -Filter '/system.webServer/security/authentication/basicAuthentication' -Location "RX-7.srv.world/auth_basic" -Name enabled -Value True 

# restart target Web site
Restart-WebItem -PSPath 'IIS:\Sites\RX-7.srv.world'

# create a test page
Write-Output "Basic Authentication Test Page" | Out-File C:\inetpub\newsite\auth_basic\index.html -Encoding Default 

# verify accesses ⇒ [-u (username)]
curl.exe -u Serverworld https://rx-7.srv.world/auth_basic/