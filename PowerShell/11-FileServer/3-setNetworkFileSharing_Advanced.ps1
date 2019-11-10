# Set Network File and Folder Sharing.
# On this example, Configure a sharing folder [D:\Share01] that only users that are in [DevGroup01] group can read and write.

# create a group
New-LocalGroup -Name "DevGroup01" 

# add a user to the group
Add-LocalGroupMember -Group "DevGroup01" -Member "User1"

# create a folder for sharing
mkdir D:\Share01

# set sharing
# -Name [share name you like]
# -Path [path of shared folder]
# -FullAccess [users or groups that is granted full-control permission]
New-SmbShare -Name "Share01" -Path "D:\Share01" -FullAccess "DevGroup01"

# grant NTFS permission
icacls "D:\Share01" /grant "DevGroup01:(OI)(CI)(F)"

# confirm settings
icacls "D:\Share01"

# remove unnecessary permissions
# disable inheritance first
icacls "D:\Share01" /inheritance:d

# remove unnecessary permissions (example blow, remove Users persmissions all)
icacls "D:\Share01" /remove "Users"

# confirm settings
icacls "D:\Share01"