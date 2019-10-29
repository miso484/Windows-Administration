# NTP Client setting is configured with NTP Server [time.windows.com] by Windows default, so in Internet connected environment computer, time and date is already synchronizing.
# If computers are in Active Directory Domain, NTP Client setting is also configured like follows, so generally it does not need to change settings.
    # Domain Controlers synchronizes time with PDC in the Domain
    # PDC in a Domain synchronizes time with PDC that is in Parent Domain or synchronizes time with other Domain Controlers
    # Client Computers synchronizes time with Domain Controler that Clients now logons
# In WorkGroup Environment Computers, it's possbile to change default NTP Server to others like follows.

# ntp server's ip
$NTP_SERVER_IP = Read-Host -Prompt "Add IP address of NTP Server: "

# confirm current synchronization NTP Server
w32tm /query /source

# change target NTP Server (replace to your timezone server)
# number means
# 0x01 : SpecialInterval
# 0x02 : UseAsFallbackOnly
# 0x04 : SymmetricActive
# 0x08 : NTP request in Client mode
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\w32time\Parameters" -Name "NtpServer" -Value "$NTP_SERVER_IP,0x8"

# restart Windows Time service
Restart-Service w32Time

# re-sync manually
w32tm /resync

# verify status
w32tm /query /status