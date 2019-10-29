# It's possbile to mount NFS Share with the command [C:\Windows\system32\mount.exe] that is installed by NFS Client installation, or also possible to use PowerShell Cmdlet [New-PSDrive] command.
# On PowerShell by default, [mount] command is set Alias to [New-PSDrive] command, so if use [mount] command, specify full name of the filename [mount.exe].


# mount with [mount.exe] on Z drive
# syntax is the same with [mount] command on Linux
mount.exe 10.0.0.101:/nfsshare Z:\ 

# verify
Get-PSDrive Z 

# unmount
umount.exe Z:\ 

# mount with [New-PSDrive] on Z drive
New-PSDrive -Name Z -PSProvider FileSystem -Root "\\10.0.0.101\nfsshare" 

# unmount
Remove-PSDrive Z 