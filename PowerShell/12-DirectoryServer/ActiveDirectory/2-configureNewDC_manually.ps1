# Configure New DC (Domain Controler).

# For example, Configure new DC with Root Domain name as [srv.world].
# After finishing commands, Computer will restart automatically.

# set forest/domain functional level as Windows Server 2016 = [WinThreshold]
# for [-DomainNetbiosName], set any NetBIOS name
# for [-SafeModeAdministratorPassword], set any password for SafeMode
Install-ADDSForest -DomainName "srv.world" `
-ForestMode WinThreshold `
-DomainMode WinThreshold `
-DomainNetbiosName FD3S01 `
-SafeModeAdministratorPassword (ConvertTo-SecureString -AsPlainText "P@ssw0rd01" -Force) `
-InstallDNS 

#Y