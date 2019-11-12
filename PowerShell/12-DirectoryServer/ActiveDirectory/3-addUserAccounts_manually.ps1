#
## 	Run PowerShell or Command Prompt and use [dsadd user] command.
#

# show current user list
dsquery user -name *

# for example, add [Redstone] user
dsadd user CN=Redstone,CN=Users,DC=srv,DC=world `
-pwd P@ssw0rd01 `
-mustchpwd yes `
-ln Redstone `
-fn R5 `
-email Redstone@srv.world `
-display "Redstone R5" 

dsquery user -name Redstone 

# options for [dsadd user]
dsadd user /? 

#
## If you'd like to delete users, use [dsrm] command.
#

# for example, delete [Redstone] user
dsrm "CN=Redstone,CN=Users,DC=srv,DC=world" 

#
## 	If you use PowerShell, It's possible to use Cmdlet for PowerShell.
#

# show current user list
Get-ADUser -Filter * | Format-Table DistinguishedName 

# for example, add [Redstone] user
New-ADUser Redstone `
-Surname Redstone `
-GivenName R5 `
-DisplayName "Redstone R5" `
-EmailAddress "Redstone@srv.world" `
-AccountPassword (ConvertTo-SecureString -AsPlainText "P@ssw0rd01" -Force) `
-ChangePasswordAtLogon $true `
-Enabled $true 

# verify
Get-ADUser -Identity Redstone 

# if delete, do like follows
Remove-ADUser -Identity "CN=Redstone,CN=Users,DC=srv,DC=world" 

# options for [New-ADUser] command
Get-Help New-ADUser 

#
## If you'd like to add UNIX attributes for existing users on PowerShell, Use [Set-ADUser] command.
#

# for example, add atrributes to [Redstone] user
Get-ADUser -Identity Redstone 

# specify minimum required attributes for UNIX/Linux users with hash table
Set-ADUser -identity "CN=Redstone,CN=Users,DC=srv,DC=world" `
-Add @{uidNumber="5001"; gidNumber="100"; loginShell="/bin/bash"; unixHomeDirectory="/home/Redstone"} 

# verify
Get-ADUser -Identity Redstone -Properties * | Out-String -Stream | Select-String "uidNumber","gidNumber","loginShell","unixHomeDirectory" 