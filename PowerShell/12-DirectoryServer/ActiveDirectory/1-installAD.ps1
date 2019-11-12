# install AD DS with admin tools
Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools

# restart computer to apply changes
Restart-Computer -Force 