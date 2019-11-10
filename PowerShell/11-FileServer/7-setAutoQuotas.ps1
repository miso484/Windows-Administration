# Set auto applied Quota settings to Volumes or Folders on File Server.
# If configured auto apply Quota to a folder, Quota template is set to subfolders (existing and new one both) in the folder automatically. (but not applied to subfolders in subfolders, it's not recursively)

# First, install FileServer Resource Manager (refer to 5-installResourceManager file)

Get-SmbShare

# display templates of Quota
Get-FsrmQuotaTemplate

# for example, set auto apply quota template with 2GB hard limit to [Share02] folder
New-FsrmAutoQuota -Path "D:\Share02" -Template "2 GB Limit" 

# if disable auto apply Quota temporally, set like follows
Set-FsrmAutoQuota -Path "D:\Share02" -Disabled:$true

# if enable disabled auto apply Quota, set like follows
Set-FsrmAutoQuota -Path "D:\Share02" -Disabled:$false

# to remove added auto apply Quota entry, set like follows
Remove-FsrmAutoQuota -Path "D:\Share02"