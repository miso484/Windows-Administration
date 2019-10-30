#
## Download Windows official image and run echo inside a Container.
#

# It's impossible to run Containers if Version of Host Windows and Container Windows is not the same one, so specify a specific version when pulling image. 
# Refer to the official documents for version compatibility.

# pull Windows ServerCore image
docker pull mcr.microsoft.com/windows/servercore:1809 

# list images
docker images
docker image -ls

# run echo inside a Container
docker run mcr.microsoft.com/windows/servercore:1809 powershell -c "echo 'Hello Windows Container World'"

#
## Connect to the interactive session of a Container with [i] and [t] option like follows. If exit from the Container session, the process of a Container finishes
## If exit from the Container session, the process of a Container finishes
#

docker run -i -t mcr.microsoft.com/windows/servercore:1809 powershell
systeminfo 
exit 

#
## If exit from the Container session with keeping container's process, push Ctrl+p, and Ctrl+q key
#

docker run -i -t mcr.microsoft.com/windows/servercore:1809 powershell 
# Ctrl+p, Ctrl+q

# connect to container's session
docker ps
#docker attach <CONTAINER_ID>
hostname

# shutdown container's process from Host's console
#docker kill <CONTAINER_ID>
docker ps 