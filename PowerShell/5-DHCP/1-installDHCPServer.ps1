# install DHCP with admin tools
Install-WindowsFeature DHCP -IncludeManagementTools 

# restart computer to apply changes
Restart-Computer -Force 