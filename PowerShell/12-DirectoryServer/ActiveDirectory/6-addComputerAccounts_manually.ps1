#
## Run PowerShell or Command Prompt and use [dsadd computer] command.
#

# show current computer list
dsquery computer -name * 

# for example, add a computer [RX-7] under the [Computers]
dsadd computer CN=RX-7,CN=Computers,DC=srv,DC=world 
dsquery computer -name RX-7 

# options for [dsadd computer]
dsadd computer /? 

# for example, delete a computer [RX-7]
dsquery computer -name RX-7 
dsrm "CN=RX-7,CN=Computers,DC=srv,DC=world" 
#y

#
## If you use PowerShell, It's possible to use Cmdlet for PowerShell.
#

# show current computer list
Get-ADComputer -Filter * | Format-Table DistinguishedName 

# for example, add a computer [RX-9]
New-ADComputer -Name RX-9 

# verify
Get-ADComputer -Filter * | Format-Table DistinguishedName 

# for adding computer with some parameters like OU or admin account
New-ADComputer -Name RX-8 `
-Path "OU=Computers,OU=Hiroshima,DC=srv,DC=world" `
-ManagedBy "CN=Serverworld,CN=Users,DC=srv,DC=world" 

# if delete, do like follows
Remove-ADComputer -Identity "CN=RX-9,CN=Computers,DC=srv,DC=world" 
#y

# options for [New-ADComputer]
Get-Help New-ADComputer 