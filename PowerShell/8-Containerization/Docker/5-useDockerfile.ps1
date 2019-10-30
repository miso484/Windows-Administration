# build image ⇒ docker build -t [image name]:[tag] .
docker build -t iis_server:latest .

# verify
docker images

# run Container on background
docker run -t -d -p 8081:80 iis_server

# verify
docker ps

# verify accesses
curl.exe localhost:8081