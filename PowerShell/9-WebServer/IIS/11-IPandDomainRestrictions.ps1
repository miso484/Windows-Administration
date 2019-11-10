# install IP and Domain Ristrictions feature
Install-WindowsFeature Web-IP-Security

# restart IIS
Restart-Service W3SVC

Get-Website

Get-ChildItem C:\inetpub\newsite

# for example, set restriction to [content01] folder on [RX-7.srv.world] site to deny from [10.0.0.128/29]
Add-WebConfiguration -Filter '/system.webServer/security/ipSecurity' -Location "RX-7.srv.world/content01" -Value @{ipAddress="10.0.0.128";subnetMask="29";allowed="false"} 

# for example, change default setting for [content02] folder on [RX-7.srv.world] site as deny all (default is allow all)
Set-WebConfigurationProperty -Filter '/system.webServer/security/ipSecurity' -Location "RX-7.srv.world/content02" -Name allowUnlisted -Value False 

# for example, set permission to [content02] folder on [RX-7.srv.world] site to allow from [10.0.0.240/255.255.255.240]
Add-WebConfiguration -Filter '/system.webServer/security/ipSecurity' -Location "RX-7.srv.world/content02" -Value @{ipAddress="10.0.0.240";subnetMask="255.255.255.240";allowed="true"} 

# restart Web site
Restart-WebItem -PSPath 'IIS:\Sites\RX-7.srv.world'