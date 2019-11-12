#
## Run PowerShell or Command Prompt and use [dsadd group] command.
#

# show current group list
dsquery group -name * 

# for example, add [DBAdmin] group
dsadd group CN=DBAdmin,CN=Users,DC=srv,DC=world `
-secgrp yes `
-scope g `
-desc "Database Admin Group" 

dsquery group -name DBAdmin 

# options for [dsadd group]
dsadd group /?

#
## For adding members to a Group, Use [dsmod group] command.
#

# for example, add [Redstone] user to [DBAdmin] group
dsmod group CN=DBAdmin,CN=Users,DC=srv,DC=world `
-addmbr CN=Redstone,CN=Users,DC=srv,DC=world 

# verify
dsget group CN=DBAdmin,CN=Users,DC=srv,DC=world -members 

# if delete a member from a group, do like follows
dsmod group CN=DBAdmin,CN=Users,DC=srv,DC=world `
-rmmbr CN=Redstone,CN=Users,DC=srv,DC=world 

#
## If you'd like to delete groups, use [dsrm] command.
#

# for example, delete [DBAdmin] group
dsrm "CN=DBAdmin,CN=Users,DC=srv,DC=world"
#y

#
## If you use PowerShell, It's possible to use Cmdlet for PowerShell.
#

# show current group list
Get-ADGroup -Filter * | Format-Table DistinguishedName 

# for example, add [DBAdmin] group
New-ADGroup DBAdmin `
-GroupScope Global `
-GroupCategory Security `
-Description "Database Admin Group" 

# verify
Get-ADGroup -Identity DBAdmin 

# if delete, do like follows
Remove-ADGroup -Identity "CN=DBAdmin,CN=Users,DC=srv,DC=world" 
#y

# options for [New-ADGroup]
Get-Help New-ADGroup 