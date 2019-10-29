# install Hyper-V with admin tools
Install-WindowsFeature Hyper-V -IncludeManagementTools 

# restart computer to apply changes
Restart-Computer -Force 