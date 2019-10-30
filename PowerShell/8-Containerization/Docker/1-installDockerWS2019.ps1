# On Windows Server 2019, Hyper-V is not required for installing Docker, only [Containers] feature is needed.
# (Docker on Windows 10 (1809) still requires Hyper-V yet)

# install container feature
Enable-WindowsOptionalFeature -Online -FeatureName Containers
# eestart the computer

# install docker (answer 'Y' to all questions)
Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
Install-Package -Name docker -ProviderName DockerMsftProvider

# service has been added with [Automatic] startup
Get-Service -Name Docker

# restart computer to apply changes
Restart-Computer -Force 

# verify
docker version