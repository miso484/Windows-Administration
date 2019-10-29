# add [miso.stamenic] user to [Remote Desktop Users] group
Add-LocalGroupMember -Group "Remote Desktop Users" -Member "miso.stamenic" 

# verify
Get-LocalUser -Name "miso.stamenic"
Get-LocalGroupMember -Group "Remote Desktop Users"