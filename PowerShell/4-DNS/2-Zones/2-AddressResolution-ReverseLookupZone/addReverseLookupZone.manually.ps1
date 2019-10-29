# For example, Add Reverse lookup Zone with settings of network [10.0.0.0/24], Zone-File [0.0.10.in-addr.arpa.dns].

Add-DnsServerPrimaryZone -NetworkID 10.0.0.0/24 -ZoneFile "0.0.10.in-addr.arpa.dns" -DynamicUpdate None -PassThru 

# verify
Get-DnsServerZone 