#
# For exmaple, update official image with installing IIS and add it as a new image for container. 
# The container is generated every time for executing docker run command, so add the latest executed container like follows.
#

# show images
docker images

# start a Container and install IIS
docker run mcr.microsoft.com/windows/servercore:1809 powershell -c "dism.exe /online /enable-feature /all /featurename:iis-webserver /NoRestart"

# add the image
(docker ps -a)[0..1]
#docker commit <CONTAINER_ID> dockeriis/iis

# show images
docker images

# Generate a Container from the new image and verify IIS is running to access to Container's localhost
docker run dockeriis/iis powershell -c "curl.exe localhost"