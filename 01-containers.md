# Creating and Using Containers

## Check Our Docker Install and Config
docker version
docker info

## Getting help about a container command
docker container --help
## Starting a container (Nginx Web Server) (not recommended)
docker container run --publish 80:80 nginx
## Starting a container (Nginx Web Server) in the background
docker container run --publish 80:80 --detach nginx
## Starting a container (Nginx Web Server) in the background w/ given name
docker container run -p 80:80 -d --name proxy nginx
    docker container run --publish 80:80 --detach --name webhost nginx
## Show default server home page in the run containers
curl localhost
## Show all run containers
docker container ls
    docker ps           (OLD SYNTAX)
## Show all containers
docker container ls -a
    docker ps -a           (OLD SYNTAX)
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


