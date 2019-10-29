# 	For example, Add A/PTR record with settings of hostname [rx-8], IP address [10.0.0.110] into a Zone [srv.world].

# for [-TimeToLive], set TTL value (if not specified, default [1:00:00] is set(an hour))
Add-DnsServerResourceRecordA -Name "rx-8" -ZoneName "srv.world" -IPv4Address "10.0.0.110" -TimeToLive 01:00:00 -CreatePtr -PassThru 

# verify
Get-DnsServerResourceRecord -ZoneName "srv.world" | Format-Table -AutoSize -Wrap