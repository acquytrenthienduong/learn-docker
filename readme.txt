// list container
docker ps 
docker ps -a

// pull image
docker pull mcr.microsoft.com/mssql/server:latest

// remove container
docker rm {container_id}
docker rm -f {container_id}

// remove image
docker rmi {image_name}
docker rmi -f {image_name}

// create container from image
// 1 image -> multi container
// -d (detach) mode
docker run --platform linux/amd64 \
-e "ACCEPT_EULA=Y" \
-e "MSSQL_SA_PASSWORD=Abcd@1234" \
--name sql-server-demo \
-p 1433:1433 \
-v {volume_name}:/var/opt/mssql \
-d mcr.microsoft.com/mssql/server

// get volume all
docker volume ls

// relative path volume 
ls -la ~/Library/Containers/com.docker.docker/Data/vms

// create network
docker network create my-network

// get list network
docker network ls

// build container -> images
docker build -f Dockerfile -t {image_name} .

// danh tag cho image
docker tag {image_name} {host}/{image_name}:{tag_name}

// login
docker login nexus.api-connect.io

// push image
docker push {host}/{image_name}:{tag_name}

docker exec -it mysql-container mysql -u root -p

docker run -d \
--name mysql-container \
--network my-network \
--network-alias my-network-alias \
-v mysql-volume:/var/opt/mysql \
-e MYSQL_ROOT_PASSWORD=Abcd@1234 \
-e MYSQL_DATABASES=testDB \
-d mysql

docker run -it \
--network my-network \
--name netshoot-container \
nicolaka/netshoot


