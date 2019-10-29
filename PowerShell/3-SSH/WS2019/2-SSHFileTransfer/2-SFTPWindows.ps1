$WINDOWS_USER = Read-Host -Prompt "Windows SSH User: "
$WINDOWS_IP = Read-Host -Prompt "Windows SSH Server IP: "

sftp "$WINDOWS_USER@$WINDOWS_IP"
    exit