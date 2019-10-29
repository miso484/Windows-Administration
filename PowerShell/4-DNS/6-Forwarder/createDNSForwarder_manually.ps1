# For example, set [10.0.0.10] as a DNS Forwarder.

Add-DnsServerForwarder -IPAddress 10.0.0.10 -PassThru 

# verify
Get-DnsServerForwarder