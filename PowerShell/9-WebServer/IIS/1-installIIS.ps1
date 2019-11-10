# install IIS (Internet Information Services) with admin tools
Install-WindowsFeature Web-Server -IncludeManagementTools 

# verify running to access to default web site
Invoke-WebRequest http://localhost 

