# If you'd like to access to services like HTTP or SSH which is running on Containers as a daemon, set like follows.

# For exmaple, use a Container which has IIS service
docker run -t -d -p 8081:80 dockeriis/iis cmd

# show containers
docker ps

# create a test page
#docker exec <CONTAINER_ID> powershell -c "Write-Output 'IIS on Docker Container' | Out-File -Encoding default C:\inetpub\wwwroot\index.html"