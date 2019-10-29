# syntax
#ssh (username)@(SSH Server's Hostname or IP address)

$WINDOWS_USER = Read-Host -Prompt "Windows SSH User: "
$WINDOWS_IP = Read-Host -Prompt "Windows SSH Server IP: "
#$LINUX_USER = Read-Host -Prompt "Linux SSH User: "
#$LINUX_IP = Read-Host -Prompt "Linux SSH Server IP: "

# example - login to Windows Host that SSH Server is running
ssh "$WINDOWS_USER@$WINDOWS_IP"

#  example - login to Linux Host that SSH Server is running
#ssh "$LINUX_USER@$LINUX_IP"

#  example - use [scp] command, [sftp] command for SSH file transfer
scp test.txt "$WINDOWS_USER@$WINDOWS_IP":"C:\Users\$WINDOWS_USER"
ssh "$WINDOWS_USER@$WINDOWS_IP" powershell -c "ls C:\Users\$WINDOWS_USER"
sftp "$WINDOWS_USER@$WINDOWS_IP"
