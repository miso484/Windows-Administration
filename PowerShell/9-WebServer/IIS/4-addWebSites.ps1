# This setting is like the Virtual Hosting on Apache httpd that is often used on Unix/Linux.

# current Web Sites list
Get-Website

# for example, add [NewSite] Site
# physical path [C:\inetpub\newsite], hostname [RX-8.srv.world]
mkdir C:\inetpub\newsite
New-WebSite -Name "NewSite" -Port 80 -HostHeader "RX-8.srv.world" -PhysicalPath "C:\inetpub\newsite"

Get-Website 

# create a test page
Write-Output "IIS Virtual Host Test Page" | Out-File C:\inetpub\newsite\index.html -Encoding Default 

# verify accesses
# default site
curl.exe localhost

# new site
curl.exe RX-8.srv.world