# When Container is removed, data in it are also lost, so it's necessary to use external filesystem in Container as persistent storage if you need.

#
# It's possible to mount any folders on parent Docker Host as external storage in Containers.
# Use dockerfile from part 5
#

# create a folder for storing datas
mkdir C:\docker-storage

# create a test file
Write-Output 'Docker Persistent Storage Test' | Out-File -Encoding default C:\docker-storage\index.html

# start Container and mount the folder above on [C:\inetpub\wwwroot] in Container
docker run -t -d -p 8081:80 -v C:\docker-storage:C:\inetpub\wwwroot iis_server

docker ps

# verisy accesses to mount normally
curl.exe localhost:8081