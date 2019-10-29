#	Add MX record to define Mail Server to use
# For example, Add MX record with settings of hostname [rx-8] into a Zone [srv.world] as Mail exchanger.

# for [-Preference], specify priority of mail Server (default is [10])
Add-DnsServerResourceRecordMX -Name "rx-8" -MailExchange "rx-8.srv.world" -ZoneName "srv.world" -Preference 10 -TimeToLive 01:00:00 -PassThru 

# verify
Get-DnsServerResourceRecord -ZoneName "srv.world" | Format-Table -AutoSize -Wrap