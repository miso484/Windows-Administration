# create a shared folder with Host based access permission

# create NFS Shared Folder
mkdir C:\NFSshare

# set NFS Share
New-NfsShare -Name "NFSshare01" `
-Path "C:\NFSshare" `
-EnableUnmappedAccess $True `
-Authentication Sys 

# grant Read/Write access permission to a Host 10.0.0.110
Grant-NfsSharePermission -Name "NFSshare01" `
-ClientName "10.0.0.110" `
-ClientType "host" `
-Permission "readwrite" `
-AllowRootAccess $True 

# confirm settings
Get-NfsShare -Name "NFSshare01" 

Get-NfsSharePermission -Name "NFSshare01" 