# For example, set [10.0.0.10] as a Conditional Forwarder.
Add-DnsServerConditionalForwarderZone -Name "server.education" -MasterServers 10.0.0.10 -PassThru

# verify
Get-DnsServerZone 