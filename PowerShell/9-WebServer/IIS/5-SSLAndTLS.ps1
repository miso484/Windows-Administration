#
## First, Buy or Get ot Create SSL Certificate.
#

# refer to 4-createSelftSignedCertificate.ps1 to create Self Signed SSL Certificate

# use win-acme packages to create Let's Encrypt SSL certificate


#
## If you use SSL certificate that you got or create it on another Host, import it first.
## If you created self signed certificate on the same Host with IIS like the link of [1], this work does not need, skip here
#

# store export password you set on certificate to a variable
$Password = ConvertTo-SecureString -AsPlainText -Force "P@ssw0rd" 

# import to [Cert:\LocalMachine\My]
# ⇒ on GUI look, stored under [Certificates - Local Computer] - [Personal]
Import-PfxCertificate -FilePath C:\Users\Administrator\rx-7.pfx -CertStoreLocation Cert:\LocalMachine\My -Password $Password


#
## Configure SSL/TLS settings on a Web Site.
## This example is based on the environment that certificate is stored under the [Cert:\LocalMachine\My]
#

# confirm certificate
Get-ChildItem Cert:\LocalMachine\My
# example thubmprint output: 228940060FF922175C2F435A135FD1CB26FC3A84

# store target certificate to a variable $Cert
$Cert = Get-ChildItem Cert:\LocalMachine\My\228940060FF922175C2F435A135FD1CB26FC3A84 

Get-Website 

# set SSL Binding to [RX-7.srv.world] site
New-WebBinding -Name "RX-7.srv.world" -IPAddress "*" -HostHeader "rx-7.srv.world" -Port 443 -Protocol https

# set $Cert to SSL Binding
New-Item IIS:\SslBindings\0.0.0.0!443!rx-7.srv.world -Value $Cert

Get-Website

# verify accesses
# if self signed certificate, add [-k] (--insecure) option
curl.exe https://rx-7.srv.world/ 