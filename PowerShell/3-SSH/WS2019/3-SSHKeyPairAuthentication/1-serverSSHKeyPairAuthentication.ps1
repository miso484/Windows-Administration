# Configure SSH server to login with Key-Pair Authentication
# logon with common user you'd like to set SSH key-pair

# run [ssh-keygen] command to generate SSH key-pair
ssh-keygen

# go to C:\Users\<USER>\.ssh
Set-Location ~
Get-ChildItem

# change Security setting for [authorized_keys] file
# remove Everyone:(RX) rights since it prevents SSH eky-pair authentication
Move-Item id_rsa.pub authorized_keys
Get-ChildItem
icacls authorized_keys
icacls authorized_keys /remove Everyone
icacls authorized_keys
