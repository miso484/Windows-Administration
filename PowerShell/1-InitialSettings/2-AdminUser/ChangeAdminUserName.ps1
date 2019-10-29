# change the name [Administrator] to [DevOpsAdmin]
Rename-LocalUser -Name "Administrator" -NewName "DevOpsAdmin"

# verify
Get-LocalUser