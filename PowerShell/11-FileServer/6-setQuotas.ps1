# Set Quotas to Volumes or Folders on File Server.

# First, install FileServer Resource Manager (refer to 5-installResourceManager file)

Get-SmbShare

# display templates of Quota
Get-FsrmQuotaTemplate

# for example, apply 2GB hard limit template to [Share01] folder
New-FsrmQuota -Path "D:\Share01" -Description "limit usage to 2 GB based on template" -Template "2 GB Limit"

# if disable applied Quota temporally, set like follows
Set-FsrmQuota -Path "D:\Share01" -Disabled:$true

# if enable disabled Quota, set like follows
Set-FsrmQuota -Path "D:\Share01" -Disabled:$false

# to remove added Quota entry, set like follows
Remove-FsrmQuota -Path "D:\Share01"