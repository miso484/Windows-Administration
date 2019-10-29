# check network interfaces
Get-NetIPInterface -AddressFamily IPv4

# set DHCP off (replace InterfaceIndex number to your own environment (ifIndex above))
#Set-NetIPInterface -InterfaceIndex 21 -Dhcp Disabled

# for example, set IP address [10.0.0.101/24], gateway [10.0.0.1]
#New-NetIPAddress -InterfaceIndex 6 -AddressFamily IPv4 -IPAddress "10.0.0.101" -PrefixLength 24 -DefaultGateway "10.0.0.1" 

# for example, set DNS [10.0.0.10]
#Set-DnsClientServerAddress -InterfaceIndex 21 -ServerAddresses "10.0.0.10" -PassThru

# confirm settings
ipconfig /all 
