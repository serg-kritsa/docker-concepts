
[https://docs.docker.com/develop/develop-images/dockerfile_best-practices/]
[https://hub.docker.com/_/node]
[https://www.youtube.com/watch?v=e2pAkcqYCG8]

# Docker Compose Basics
cd path/to/folder/where/docker-compose.yml

## Create and start containers in foreground mode. Ctrl+C will stop containers 
docker compose up

## Create and start containers in detach mode
docker compose up -d
    -d          detach mode
## Build or rebuild services in docker-compose.yml
docker compose build --no-cache
    --no-cache          Do not use cache when building the image
### List images
docker image ls
### List containers
docker compose ps
### View output from containers
docker compose logs
### View output from service declared in docker-compose.yml
docker compose logs web

### Execute a command in a running container. but required tool is not installed
docker compose exec web sh
    curl localhost
    exit
#### To install is better edit Dockerfile. Add after EXPOSE `RUN apk add --update curl` line
docker compose down
NOTE: existing image doesn't rebuild using `docker compose up -d`
docker compose up -d --build
### Execute the same command again in a running container
docker compose exec web sh
    curl localhost:3000
    exit

## Stop and remove containers, networks
docker compose down
## Stop and remove containers, networks and images
docker compose down --rmi all
