cd /path/to/Dockerfile
## Build from Dockerfile
docker build -t centos-node .

## Check out installed Nodejs version
docker run --rm centos-node node --version





USER node

RUN mkdir app && chown -R node:node .

docker compose exec -u root