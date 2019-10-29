# install DNS with admin tools
Install-WindowsFeature DNS -IncludeManagementTools 

# restart computer to apply changes
Restart-Computer -Force 