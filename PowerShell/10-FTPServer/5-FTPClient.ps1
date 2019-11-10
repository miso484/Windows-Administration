# Connect to the FTP server from Client Computers.

# Make sure that the FTP server is configured in passive mode.

# On passive mode connection, client program [ftp] command bundled in Windows 10 or Windows Server 2019 (or old versions) can not use passive mode (even if with [quote pasv]), so it needs to use other FTP Client program.

# On this example, Use FileZilla.
#⇒ https://filezilla-project.org/download.php?type=client

#       GUI
# 1. 	Install FileZilla and run it, then Open [File] - [Site Manager].
# 2.    Click [New Site] button and input information for FTP connection.
#       For [Host] field, input Hostname or IP address of FTP server.
#       For [Logon Type] filed, select [Ask for password] or other type except [Anonymous].
# 3.    Password is required, input it of the connected user.
# 4.   	If you use self-signed certificate, following warning is shown because it is self-signed one. Click [OK] to proceed.
# 5.    Just connected to FTP site. Try to transfer files.