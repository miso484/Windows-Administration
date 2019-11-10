# Enable HSTS (Hypertext Strict Transport Security) for Web Sites.

# For [includeSubDomains] option below, all subdomains are included in HSTS target, so you need to verify well before setting it's possible to access to all subdomains with HTTS if specify this option.

# First enable SSL or TLS (refer to 5-SSLAndTLS.ps1 file)

# get site collection
$sitesCollection = Get-IISConfigSection -SectionPath "system.applicationHost/sites" | Get-IISConfigCollection

# get web site you'd like to set HSTS
# specify the name of site for "name"="***"
$siteElement = Get-IISConfigCollectionElement -ConfigCollection $sitesCollection -ConfigAttribute @{"name"="RX-7.srv.world"} 

# get setting of HSTS for target site
$hstsElement = Get-IISConfigElement -ConfigElement $siteElement -ChildElementName "hsts"

# enable HSTS for target site
Set-IISConfigAttributeValue -ConfigElement $hstsElement -AttributeName "enabled" -AttributeValue $true 

# set [max-age] of HSTS as 31536000 sec (365 days)
# for [max-age], refer to https://hstspreload.org/ 
Set-IISConfigAttributeValue -ConfigElement $hstsElement -AttributeName "max-age" -AttributeValue 31536000

# set [includeSubDomains] of HSTS as enabled
# this option applys to all subdomains
Set-IISConfigAttributeValue -ConfigElement $hstsElement -AttributeName "includeSubDomains" -AttributeValue $true

# set [redirectHttpToHttps] of HSTS as enabled
Set-IISConfigAttributeValue -ConfigElement $hstsElement -AttributeName "redirectHttpToHttps" -AttributeValue $true