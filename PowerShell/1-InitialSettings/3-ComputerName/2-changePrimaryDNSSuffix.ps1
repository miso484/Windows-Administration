# change Primary DNS Suffix to [company.org]
Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\" –Name "NV Domain" –Value "company.org" -PassThru

# restart Computer to apply changes
Restart-Computer -Force 

# verify
(ipconfig /all)[0..9] 