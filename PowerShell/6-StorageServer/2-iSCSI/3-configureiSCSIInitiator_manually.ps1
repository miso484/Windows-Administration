# start iSCSI Initiator service & set [automatic] for Startup
Start-Service -Name MSiSCSI 
Set-Service -Name MSiSCSI -StartupType Automatic 

# set iSCSI Target to connect to
New-IscsiTargetPortal -TargetPortalAddress "10.0.0.101" 

# show iSCSI Target
Get-IscsiTarget 

# connect to iSCSI Target
# [-NodeAddress] ⇒ the name confirmed above
# [-ChapUsername] ⇒ username that you set on iSCSI Target Config
# [-ChapUsername] ⇒ password of the user above
Connect-IscsiTarget `
-NodeAddress iqn.1991-05.com.microsoft:rx-7-iscsitarget01-target `
-AuthenticationType ONEWAYCHAP `
-ChapUsername "username" `
-ChapSecret "UserP@ssw0rd01" `
-IsPersistent $True 

# show established connection
Get-IscsiConnection 

# show disks
# on the example blow, [Number 1] is the iSCSI disk
Get-Disk | Format-Table -AutoSize -Wrap 