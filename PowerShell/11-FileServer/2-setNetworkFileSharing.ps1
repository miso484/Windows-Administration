# Set Network File and Folder Sharing.

# On this example, Configure a sharing folder [D:\ShareAll] that everyone can read and write.

# create a folder for sharing
mkdir D:\ShareAll

# set sharing
# -Name [share name you like]
# -Path [path of shared folder]
# -FullAccess [users or groups that is granted full-control permission]
New-SmbShare -Name "ShareAll" -Path "D:\ShareAll" -FullAccess "Everyone"

# grant NTFS permission
icacls "D:\ShareAll" /grant "Everyone:(OI)(CI)(F)" 

# confirm settings
Get-SmbShare -Name "ShareAll" | Format-List -Property *