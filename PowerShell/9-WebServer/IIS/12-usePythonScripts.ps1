#
## install python
#

# download
Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.7.4/python-3.7.4-amd64.exe" -OutFile "python-3.7.4-amd64.exe"

# install (to System Wide + set PATH)
.\python-3.7.4-amd64.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

# reload environment variables
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# verify 
python -V 

#
## configure iis
#

# Install CGI and ISAPI extension feature
Install-WindowsFeature Web-CGI,Web-ISAPI-Ext 

# restart IIS
Restart-Service W3SVC 

Get-Website 

Get-ChildItem C:\inetpub\newsite

# add Python to ISAPI/CGI extension
Add-WebConfiguration -Filter '/system.webServer/security/isapiCgiRestriction' -Value @{description="Python";path="C:\Program Files\Python37\python.exe %s %s";allowed="true"}

# for example, set [*.py] scripts as executable under [content01] folder on [RX-7.srv.world] site
Set-WebConfigurationProperty -Filter '/system.webServer/handlers' -Location "RX-7.srv.world/content01" -Name accessPolicy -Value "Read, Script"

Add-WebConfiguration -Filter '/system.webServer/handlers' -Location "RX-7.srv.world/content01" -Value @{name="Python Interpreter";path="*.py";verb="*";modules="CgiModule";scriptProcessor="C:\Program Files\Python37\python.exe %s %s";resourceType="File"}

# restart Web site
Restart-WebItem -PSPath 'IIS:\Sites\RX-7.srv.world' 

# create test script
$str_document = @'
print("Content-type: text/html\n\n")
print("Python Script Test Page on IIS")
'@ 

Write-Output $str_document | Out-File C:\inetpub\newsite\content01\test.py -Encoding Default 

# verify to access
curl.exe https://rx-7s.srv.world/content01/test.py
