# On DNS Stub Host, Configure Stub Zone.

# Before, install DNS Server feature with admin tools on Stub Host too
Install-WindowsFeature DNS -IncludeManagementTools 

# restart computer to apply changes
Restart-Computer -Force 

# add stub zone of [srv.world]
Add-DnsServerStubZone -Name "srv.world" -MasterServers "10.0.0.101" -ZoneFile "srv.world.dns" -PassThru 

# verify
Get-DnsServerZone 