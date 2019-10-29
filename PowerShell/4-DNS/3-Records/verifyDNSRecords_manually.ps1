# with nslookup command
# [nslookup (hostname to resolv) (server to ask)]
nslookup rx-8.srv.world localhost 

nslookup 10.0.0.110 localhost 

# with PowerShell Cmdlet
# Forward lookup
Resolve-DnsName rx-8.srv.world -Type A -Server localhost 

# Reverse lookup
Resolve-DnsName 10.0.0.110 -Type PTR -Server localhost 