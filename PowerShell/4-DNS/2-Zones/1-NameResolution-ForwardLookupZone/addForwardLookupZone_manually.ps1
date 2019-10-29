# For example, Add Forward lookup Zone with settings of Zone-Name [srv.world], Zone-File [srv.world.dns].
# Generally, set your domain name or portion of domain name for this Zone-Name.

Add-DnsServerPrimaryZone -Name "srv.world" -ZoneFile "srv.world.dns" -DynamicUpdate None -PassThru

# verify
Get-DnsServerZone 