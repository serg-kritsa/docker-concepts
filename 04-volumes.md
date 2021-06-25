# Container Lifetime & Persistent Data: Volumes, Volumes, Volumes

## Data Volumes
docker pull mysql
docker image inspect --format '{{ .Config.Volumes }}' mysql

### Volume Will remain after removing
docker container run -d --name mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=True mysql
docker container inspect --format '{{ .Mounts }}' mysql
docker volume ls
docker volume inspect ###
docker container stop mysql
docker volume ls
docker container ls -a
docker container rm mysql mysql2
docker volume ls

### Bind mount a named volume
docker container run -d --name mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=True -v mysql-db:/var/lib/mysql mysql
    -v, --volume list                    Bind mount a volume
docker volume ls
docker volume inspect mysql-db

### Existing volume can be used later
docker container run -d --name mysql3 -e MYSQL_ALLOW_EMPTY_PASSWORD=True -v mysql-db:/var/lib/mysql mysql

### Creating volume
docker volume create --help

#### Windows
$(pwd)      it works!
docker container run -d --name vnginx -p 80:80 -v ${pwd}:/usr/share/nginx/html nginx
#### Full path in Windows
docker container run -d --name vnginx -p 80:80 -v C:\Users\user\Desktop\cookbooks\docker:/usr/share/nginx/html nginx
docker container run -d --name vnginx -p 80:80 -v //c/Users/user/Desktop/cookbooks/docker:/usr/share/nginx/html nginx
#### Linux
docker container run -d --name vnginx -p 80:80 -v $(pwd):/usr/share/nginx/html nginx

docker container inspect --format '{{ .HostConfig.Binds }}' vnginx

## Bind volume from disk in Windows
cd dockerfile-01-copy-file-into-image
docker container run -d --name nginx-custom -p 80:80 -v ${pwd}:/usr/share/nginx/html nginx
curl localhost
(2nd terminal) docker container exec -it nginx-default bash
(2nd terminal) # ls
echo test > testfile
(2nd terminal) # ls
(2nd terminal) # exit
docker container rm -f nginx-custom 

docker container run -d --name nginx-default -p 8080:80 nginx
curl localhost:8080
docker container rm -f nginx-default


## Updating container case. The same volume should be used 
docker container run -d --name psql -p 80:80 -e POSTGRES_PASSWORD=passwd -v psql-db:/var/lib/postgesql/data postgres:9.6.1
docker container run -d --name psql2 -p 80:80 -e POSTGRES_PASSWORD=passwd -v psql-db:/var/lib/postgesql/data postgres:9.6.2
docker container logs -f psql-db
