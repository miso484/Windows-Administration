# Install DNS Server feature with admin tools on Secondary Host first
Install-WindowsFeature DNS -IncludeManagementTools 

# restart computer to apply changes
Restart-Computer -Force 

# add secondary zone of [srv.world]
Add-DnsServerSecondaryZone -Name "srv.world" -ZoneFile "srv.world.dns" -MasterServers 10.0.0.101 -PassThru 

# verify
Get-DnsServerZone 