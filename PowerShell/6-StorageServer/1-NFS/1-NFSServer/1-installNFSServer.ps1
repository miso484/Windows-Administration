# install NFS Server with admin tools
Install-WindowsFeature FS-NFS-Service -IncludeManagementTools 

# restart computer to apply changes
Restart-Computer -Force 