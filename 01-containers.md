# Creating and Using Containers

## Check our docker config
docker version
## Display system-wide information
(OLD SYNTAX)    docker info           
docker system info
## Show docker disk usage (images, containers, local volumes and build cache)
docker system df

### Remove unused containers and local volumes
(OLD SYNTAX)    docker prune
docker system prune --help
docker system prune
    y   to confirm 
### Remove unused data
docker system prune -a
    -a          Remove all unused images not just dangling ones
    -f, --force Do not prompt for confirmation
### Clean up just "dangling" images
docker image prune
### Remove all not used images
docker image prune -a
    -a, --all       Remove all unused images not just dangling ones
    -f, --force     Do not prompt for confirmation
## Getting help about a container command
docker container --help
## Starting a container (not recommended)
docker container run --publish 80:80 nginx
## Starting a container in the background
docker container run --publish 80:80 --detach nginx
(OLD SYNTAX)    docker container run --publish 80:80 --detach nginx
## Starting a container in the background w/ given name
docker container run -p 80:80 -d --name webhost nginx
    -p, --publish list  Publish a container's port(s) to the host
    -d, --detach        Run container in background and print container ID
    --name string       Assign a name to the container                                   
## Show default server home page in the run containers
curl localhost
## Show all run containers
(OLD SYNTAX)    docker ps           
docker container ls
    -q  show CONTAINER_ID only 
## Show all containers
(OLD SYNTAX)    docker ps -a           
docker container ls -a
    -a  all
## Stopping a container w/ given id
docker container stop ###
## Stopping a container w/ given name
docker container stop webhost
## Running an existing container w/ name
docker container start webhost
## Show the processes in an existing container w/ name
docker container top webhost
## Show the logs in a container w/ name
docker container logs webhost
## Removing a container w/ given name
docker container rm webhost
## Removing a container w/ given id
docker container rm ###
## Removing FORCE a run container w/ given name
docker container rm -f webhost
## Removing FORCE a run container w/ given id
docker container rm -f ###

## Container Is Just a Process
docker run --name mongo -d mongo
docker ps
docker top mongo
docker stop mongo
docker ps
docker top mongo
docker start mongo
docker ps
docker top mongo

## CLI Process Monitoring
docker container inspect nginx
docker container top nginx
docker container stats --help
docker container stats

## Run Mysql Container w/ random password   
docker container run -d -p 3306:3306 --name db -e MYSQL_RANDOM_ROOT_PASSWORD=yes MYSQL_RANDOM_ROOT_PASSWORD
    docker container logs db            (GENERATED ROOT PASSWORD: ###...###)

## Getting a Shell Inside Containers And Stop Container After Exit
docker container run -help
docker container run -it --name proxy nginx bash
    # exit
docker container start -ai proxy
    # exit
## Executing a Shell Command Inside RUNNING Container
docker container exec -it proxy bash
### Executing a Shell Command Inside RUNNING Container. Redis example from CLI
(1st terminal) docker container run --name myredis redis
(2nd terminal) docker container exec -it --name myredis redis-cli

## Downloading an Image
docker pull nginx
## Show all downloaded images
docker image ls

## Show Forward Port for Container
docker container run -p 80:80 --name webhost -d nginx
docker container port webhost
## Show the Container Net Firewall IPAddress
docker container inspect --format '{{ .NetworkSettings.IPAddress }}' webhost

## CLI Management of Virtual Networks
docker network --help
docker network ls
docker network inspect bridge
docker network inspect bridge --format '{{ .Containers }}' 
## Create a Virtual Network w/ Default Bridge Driver
docker network create --help
docker network create my_app_net
            docker network create my_app_net --driver ###
docker network ls
## Connect new Container w/ created Virtual Network
docker container run -d --name new_nginx --network my_app_net nginx
    docker container run -d --name new_nginx --net my_app_net nginx
docker network inspect my_app_net
docker container inspect --format '{{ .NetworkSettings.Networks }}'  new_nginx
## Connect a Container w/ Virtual Network
docker network connect my_app_net webhost
docker container inspect --format '{{ .NetworkSettings.Networks }}'  webhost
## Disconnect a Container w/ Virtual Network
docker network disconnect my_app_net webhost
docker container inspect --format '{{ .NetworkSettings.Networks }}'  webhost

## Containers DNS for Finding Each Other
docker pull nginx:alpine
docker network ls
docker network inspect my_app_net
docker container run -d --name my-1 --network my_app_net nginx:alpine
docker container run -d --name my-2 --network my_app_net nginx:alpine
docker container exec -it my-1 ping my-2
docker container exec -it my-2 ping my-1

## Don't Keep Created Containers for Testing 
docker container run --rm -it centos:7 bash

## Assignment Answers: DNS Round Robin Testing
docker network create my-net
docker container run -d --net my-net --net-alias search elasticsearch:2
docker container run -d --net my-net --net-alias search elasticsearch:2
docker container ls
docker container run --rm --net my-net alpine nslookup search
docker container run --rm --net my-net centos curl -s search:9200
docker container run --rm --net my-net centos curl -s search:9200
docker container run --rm --net my-net centos curl -s search:9200
docker container ls
docker container rm -f ### ###


