# create iSCSI Target
# [-TargetName] ⇒ any Target name
# [InitiatorId] ⇒ specify Initiators to allow to connect to Target
# for specifying Initiators, possible to specify methods like follows not only IPAddress
# IPAddress, IPv6Address, DNSName, IQN, MACAddress
New-IscsiServerTarget -TargetName "iSCSITarget01" -InitiatorId @("IPAddress:10.0.0.110","IPAddress:10.0.0.111") 

# create iSCSI virtual disk
# [-Path] ⇒ any PATH you'd like to create v-disk
# [-SizeBytes] ⇒ disk size
New-IscsiVirtualDisk -Path "C:\iSCSIDisk\Disk01.vhdx" -SizeBytes 10GB 

# assign iSCSI virtual disk to iSCSI Target
Add-IscsiVirtualDiskTargetMapping -TargetName "iSCSITarget01" -Path "C:\iSCSIDisk\Disk01.vhdx" 

# enable CHAP for iSCSI Target and set Username and Password for authentication
# required password length over 12 chars
Set-IscsiServerTarget `
-TargetName "iSCSITarget01" `
-EnableChap $True `
-Chap (New-Object PSCredential("username", (ConvertTo-SecureString -AsPlainText "UserP@ssw0rd01" -Force)))`
-PassThru 

# confirm settings
Get-IscsiServerTarget -TargetName "iSCSITarget01" 

# restart service
Restart-Service -Name WinTarget 