# install iSCSI Target with admin tools
Install-WindowsFeature FS-iSCSITarget-Server -IncludeManagementTools 

# restart computer to apply changes
Restart-Computer -Force 