# turn disk online
Set-Disk -Number 1 -IsOffline $False 

# initialize it with GPT partitoon type
Initialize-Disk -Number 1 -PartitionStyle GPT 

# confirm settings
Get-Disk | Format-Table -AutoSize -Wrap 

# assign drive letter and create partition
New-Partition -DiskNumber 1 -UseMaximumSize -AssignDriveLetter 

# format with NTFS
Format-Volume -DriveLetter D -FileSystem NTFS -Force 

# confirm settings
Get-Volume | Format-Table -AutoSize -Wrap 