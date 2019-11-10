<#
Set Windows Authentication to a folder to require authentication for users.
For different point from Basic Authentication, On Basic Authentication, user authentication form is always displayed and it needs to input user information to authenticate manually.
However, On Windows Authentication, if Client Computer is Windows OS and he accesses to the Windows Authentication folder, current logon user information is sent to IIS server automatically by Web Browser and authentication process runs with it.
Therefore, if IIS Host and Client Windows Host are in the same Windows AD Domain, when accessing to Windows Authentication folder from Windows Client, authentication form is not displayed and can access to the contents in the folder without inputting user infomation because authentication process runs automatically by Web Browser.
Furthermore, even if Client Windows computer is out of AD Domain, there is a case to be able to access without inputting user authentication infomation manually. If there is a local user on Client Host that has the same username and same password with a user on IIS Host, and also set a configration on Internet Explorer that target site is added as Local Intranet Site, then, authentication process succeeds automatically.
For a few case of above only, authentication form in not displayed, but on other cases, it needs to input user authentication infomation manually, the behavior is the same with Basic Authetication on users viewpoint.
#>

#
## On this example, Configure settings that create a [auth_win] folder under the [RX-7.srv.world] site and set Windows Authentication to the Folder.
#

# install windows Authentication feature
Install-WindowsFeature Web-Windows-Auth 

# restart IIS
Restart-Service W3SVC

Get-Website

# create [auth_win] folder
New-Item -ItemType Directory -Path "IIS:\Sites\RX-7.srv.world\auth_win"

# disable anonymous authentication for target folder
Set-WebConfigurationProperty -Filter '/system.webServer/security/authentication/anonymousAuthentication' -Location "RX-7.srv.world/auth_win" -Name enabled -Value False

# enable Windows authentication for target folder
Set-WebConfigurationProperty -Filter '/system.webServer/security/authentication/windowsAuthentication' -Location "RX-7.srv.world/auth_win" -Name enabled -Value True 

# restart target Web site
Restart-WebItem -PSPath 'IIS:\Sites\RX-7.srv.world' 

# create a test page
Write-Output "Windows Authentication Test Page" | Out-File C:\inetpub\newsite\auth_win\index.html -Encoding Default

# verify accesses ⇒ [-u (username)]
# need authentication except specific some cases written in the beginning of this page
curl.exe --ntlm -u Serverworld https://rx-7.srv.world/auth_win/
#user password
