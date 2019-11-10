# Access to Share folder from Client Computer. This example is on Windows 10.

# If you'd like to access to Share folder even from Explorer on GUI after setting accesses to Share on CUI like follows, then, Run PowerShell without admin Privilege. Because Security Context added on PowerShell (or Command Prompt) with admin Privilege and added on Explorer on GUI with common user authority are different, so mounted Share folder with admin Privilege will be never shown on Explorer on GUI with common user authority.

# on all examples here, specifying authentication user and password is not needed on specific cases like follows

# * server/client are both in AD Domain and also logon user on Client is allowed to access to Share
# * even on workgroup environment, a user exists on Client that name is the same with the user that is allowed to access to Share on Server and also their password is the same

### with New-SmbMapping 
# -LocalPath [drive letter]
# -RemotePath [\\(Server name)\(Share name)]
# -UserName [authenticated username] -Password [password]
# -Persistent [$true|$false]
#   $true means enabled, $false means mapping is valid only on current session
New-SmbMapping -LocalPath "Z:" `
-RemotePath "\\rx-7.srv.world\Share01" `
-UserName "User1" -Password "P@ssw0rd01" `
-Persistent $true 

# confirm
Get-SmbMapping
ls Z:\ 

# to disconnect Share, run like follows
Remove-SmbMapping -LocalPath "Z:" 

### with New-PSDrive 
# -Name [any drive name you like]
#   if you set drive persistently with [-Persist], it needs to specify drive letter like "Z:", "Y:" and so on)
# -PSProvider [FileSystem]
#   if filesystem, specify [FileSystem], but if registry, specify [Registry]
# -Root [\\(Server name)\(Share name)]
# -Credential (specify authenticated username/password)]
#   example below uses a user (User1/P@ssw0rd01)
# -Persist (if with this option, mapping keeps persistently, if not specify, mapping is valid only on current session)
New-PSDrive -Name "Share01" `
-PSProvider FileSystem `
-Root "\\rx-7.srv.world\Share01" `
-Credential (New-Object PSCredential("User1", (ConvertTo-SecureString -AsPlainText "P@ssw0rd01" -Force)))

# confirm
Get-PSDrive -Name "Share01" | Format-Table -AutoSize
ls Share01:\

# to disconnect Share, run like follows
Remove-PSDrive "Share01"

### with net use
# net use [drive letter (optional)] [\\(Server name)\(Share name)] [/user:(username)] [password (if not specified, need to input intaractively)] [/persistent:(yes|no) (default is [Yes])]
net use "\\rx-7.srv.world\Share01" /user:User1 P@ssw0rd01 /persistent:no
ls "\\rx-7.srv.world\Share01"

# to disconnect Share, run like follows
net use "\\rx-7.srv.world\Share01" /delete