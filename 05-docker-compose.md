[https://docs.docker.com/develop/develop-images/dockerfile_best-practices/]
[https://www.youtube.com/watch?v=e2pAkcqYCG8]

# Docker Compose Basics
cd path/to/folder/where/docker-compose.yml

# Docker Compose: The Multi-Container Tool
docker compose --help[Compose file Reference and guidelines](https://docs.docker.com/compose/compose-file/)
## Trying Out Basic Compose Commands

## Create and start containers from docker-compose file in foreground mode. Ctrl+C will stop containers 
docker compose up   
## View output from containers
docker compose logs
## View output from service declared in docker-compose.yml
docker compose logs web

## Create and start containers from docker-compose file in BACKGROUND (detach) mode
docker compose up -d
    -d          detach mode
## Stop and remove containers, networks
docker compose down --help
docker compose down
## Remove Built in a Compose File Images
docker compose down --rmi local

## Build or rebuild image after changes in Dockerfile, f.e. adding after EXPOSE `RUN apk add --update curl` line
docker compose down
**NOTE**: existing image doesn't rebuild using `docker compose up -d`
docker compose up -d --build
    -d, --detach        Detached mode: Run containers in the background
    --build             Build images before starting containers.
### rebuild w/o image cache 
docker compose build --no-cache
    --no-cache          Do not use cache when building the image

## List images
docker image ls
## List containers
docker compose ps
## Display the running processes
docker compose top
docker compose down

## Execute a command in a running container. but required tool is not installed
docker compose exec web sh
    curl localhost
    exit

