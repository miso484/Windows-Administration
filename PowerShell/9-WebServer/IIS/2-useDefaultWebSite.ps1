# After installing IIS, a Web Site setting [Default Web Site] is configured.

# show Sites list : [Default Web Site] is only set
Get-Website 

# [Physical Path] is the Document Root
Get-ChildItem C:\inetpub\wwwroot 

# verify accesses : [iisstart.htm] responds
Invoke-WebRequest localhost 

# confirm default documents
Get-WebConfigurationProperty -Filter "//defaultDocument/files/add" -PSPath "IIS:\Sites\Default Web Site" -Name "value" | select value

# create a test page under the Document Root and verify working
# [Write-Output] generates with UTF-16, so specify encoding explicitly with [Out-File]
Write-Output "IIS Default Start Page" | Out-File C:\inetpub\wwwroot\Default.htm -Encoding Default

# verify accesses
# for [curl.exe], specify extension ⇒ if not specify extension, [curl] is an Alias from [Invoke-WebRequest]
curl.exe localhost 