# if your Server to install DHCP is stand-alone Server, it's OK to logon to configure with local Administrator account, but if your Server is in Active Directory Domain, 
# Authorization from AD is required to configure DHCP Server as valid Server, so logon to configure with a user that is AD Domain user in Domain Admin group

# add security group for DHCP
Add-DhcpServerSecurityGroup -ComputerName "RX-7.srv.world" 

# if computer is in AD domain, run the command below to get authorization from AD
Add-DhcpServerInDC -DnsName "RX-7.srv.world" -IPAddress 10.0.0.101 -PassThru 

# add a Scope for IPv4
# [-Name] ⇒ any name you like
# [-StartRange] ⇒ start IP address for lease
# [-EndRange] ⇒ end IP address for lease
# [-LeaseDuration] ⇒ lease period [day.hrs:mins:secs] (if not specified, default is 8 days)
Add-DhcpServerv4Scope -Name "Internal Network" `
-StartRange 10.0.0.200 `
-EndRange 10.0.0.254 `
-SubnetMask 255.255.255.0 `
-LeaseDuration 8.00:00:00 `
-State Active `
-PassThru 

# set Domain Name, DNS Server, Gateway(Router) to the Scope
Set-DhcpServerv4OptionValue -DnsDomain "srv.world" `
-DnsServer "10.0.0.100" `
-Router "10.0.0.1" `
-ScopeId "10.0.0.0" `
-PassThru 

Restart-Service DHCPServer 