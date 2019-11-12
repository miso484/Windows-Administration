#
## Run PowerShell or Command Prompt and use [dsadd ou] command.
## The command does not have an option to enable [Protect container from accidental deletion], but if you'd like to enable it, use PowerShell Cmdlet Section from below.
#

# show current Organizational Unit list
dsquery ou -name * 

# for example, add an Organizational Unit [Hiroshima]
dsadd ou OU=Hiroshima,DC=srv,DC=world 
dsquery ou -name Hiroshima 

# for adding OU under the existing OU, specifu the Path like follows
# add an OU [Development01] under the OU [Hiroshima]
dsadd ou OU=Development01,OU=Hiroshima,DC=srv,DC=world 

# options for [dsadd ou]
dsadd ou /? 

#
## If you'd like to delete Organizational Units, use [dsrm] command.
## This command is based on the case the option [Protect container from accidental deletion] is not enabled for Organizational Unit, if enabled, Use PowerShell Cmdlet Section from below.
#

# for example, delete an OU [Development01]
dsquery ou -name Development01 
dsrm "OU=Development01,OU=Hiroshima,DC=srv,DC=world" 
#y


#######################################################################
## If you use PowerShell, It's possible to use Cmdlet for PowerShell. #
#######################################################################

# show current Organizational Unit list
Get-ADOrganizationalUnit -Filter * | Format-Table DistinguishedName 

# for example, add [Development01] under the [Hiroshima]
New-ADOrganizationalUnit Development01 `
-Path "OU=Hiroshima,DC=srv,DC=world" `
-ProtectedFromAccidentalDeletion $True 

# verify
Get-ADOrganizationalUnit -Filter * | Format-Table DistinguishedName 

# if the option [ProtectedFromAccidentalDeletion] is enabled,
# disable it first and delete it
Set-ADOrganizationalUnit `
-Identity "OU=Development01,OU=Hiroshima,DC=srv,DC=world" `
-ProtectedFromAccidentalDeletion $false 

Remove-ADOrganizationalUnit -Identity "OU=Development01,OU=Hiroshima,DC=srv,DC=world" 
#y

# options for [New-ADOrganizationalUnit]
Get-Help New-ADOrganizationalUnit 