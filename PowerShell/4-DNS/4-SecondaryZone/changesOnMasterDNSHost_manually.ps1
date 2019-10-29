# Add DNS Secondary Host on Name-Server setting on DNS Master Host first.

# add [rx-8.srv.world] host as name-server in [srv.world] zone
Add-DnsServerResourceRecord -Name "@" -NS -ZoneName "srv.world" -NameServer "rx-8.srv.world" -PassThru

# verify
Get-DnsServerResourceRecord -ZoneName "srv.world" | Format-Table -AutoSize -Wrap 