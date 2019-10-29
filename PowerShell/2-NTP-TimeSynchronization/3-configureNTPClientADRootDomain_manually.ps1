# in AD Domain Environment, [Type] is set to [NT5DS]
(Get-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\w32time\Parameters").GetValue("Type")

# if target is [Local CMOS Clock] but you'd like to change it, change [Type] to [NTP] first
# next, change to NTP server with the same way in [1] section
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\w32time\Parameters" -Name "Type" -Value "NTP" 