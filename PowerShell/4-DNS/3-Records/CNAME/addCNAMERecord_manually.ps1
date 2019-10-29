#	Add CNAME record which is another name (Alias) of an A-record.

# 	For example, Add CNAME record [fd3s] to a Host [rx-7] in a Zone [srv.world].
Add-DnsServerResourceRecordCName -Name "fd3s" -HostNameAlias "rx-7.srv.world" -ZoneName "srv.world" -PassThru 

# verify
Get-DnsServerResourceRecord -ZoneName "srv.world" | Format-Table -AutoSize -Wrap
Resolve-DnsName fd3s.srv.world -Server localhost 