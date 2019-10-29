# add [miso.stamenic] user to [Administrators] group
Add-LocalGroupMember -Group "Administrators" -Member "miso.stamenic" 

# verify
Get-LocalUser -Name "miso.stamenic"
Get-LocalGroupMember -Group "Administrators"