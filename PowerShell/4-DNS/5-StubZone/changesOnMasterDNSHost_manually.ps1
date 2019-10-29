# By default, Name-Servers that are added in each Zone setting on DNS Master Host are the allowed Hosts to be transfered Zone files.
# So Add DNS Stub Host on Name-Server setting on DNS Master Host first.

# add [rx-8.srv.world] host as name-server in [srv.world] zone
Add-DnsServerResourceRecord -Name "@" -NS -ZoneName "srv.world" -NameServer "rx-8.srv.world" -PassThru

# verify
Get-DnsServerResourceRecord -ZoneName "srv.world" | Format-Table -AutoSize -Wrap