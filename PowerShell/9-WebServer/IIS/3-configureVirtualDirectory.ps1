# It's possible to set specific physical folder as a specific URL Path

Get-Website -Name "Default Web Site" 

# for example, set physical folder [C:\inetpub\wwwroot\virtual_dir], URL Path [/vDir] on [Default Web Site]
mkdir C:\inetpub\wwwroot\virtual_dir
New-WebVirtualDirectory -Site "Default Web Site" -Name "vDir" -PhysicalPath "C:\inetpub\wwwroot\virtual_dir"

# verify
Get-WebVirtualDirectory -Site "Default Web Site"

# create a test page
Write-Output "IIS Virtual Directory Test Page" | Out-File C:\inetpub\wwwroot\virtual_dir\index.html -Encoding Default

# verify accesses
curl.exe localhost/vDir/