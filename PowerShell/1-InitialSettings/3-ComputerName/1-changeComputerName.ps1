# change Computer Name to [DEVSRV-1]
Rename-Computer -NewName DEVSRV-1 -Force -PassThru

# restart Computer to apply changes
Restart-Computer -Force

# verify
(ipconfig /all)[0..9] 