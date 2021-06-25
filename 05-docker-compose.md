# Docker Compose: The Multi-Container Tool
docker compose --help[Compose file Reference and guidelines](https://docs.docker.com/compose/compose-file/)
## Trying Out Basic Compose Commands

## Create and start containers from docker-compose file
docker compose up
## Stop and remove containers, networks
docker compose down
## Create and start containers from docker-compose file in BACKGROUND mode
docker compose up -d
### View output from containers
docker compose logs

## List containers
docker compose ps
## Display the running processes
docker compose top
docker compose down

## Remove Built in a Compose File Images
docker compose down --help
docker compose down --rmi local