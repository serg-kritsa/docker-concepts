# Container Images, Where To Find Them and How To Build Them

## Docker Hub Registry Images
https://hub.docker.com/search?q=&type=image
https://hub.docker.com/_/nginx
    see TAG     IMAGE ID    columns
    see numbers of stars and pulls for not official
docker image ls
    see TAG     IMAGE ID    columns
docker pull nginx
docker pull nginx:1.11.9
docker pull nginx:1.11
docker pull nginx:1.11.9-alpine
docker image ls

## History of Pulled Image Layers
docker history nginx:latest

## Full Image Description
docker image inspect nginx


## Image Tagging and Pushing to Docker Hub
docker image tag -- help
## Base Image
docker pull mysql
## Specific Image
docker pull mysql/mysql-server

## Create new Local Image Tagged from Existing Image, but Image ID will be the same
docker image tag nginx sergkritsa/nginx
## Add Specific Tag To Image 
docker image push sergkritsa/nginx sergkritsa/nginx:testing

## Login into Existing Account
docker --help
docker login
### Auth Key Stored here 
    cat .docker/config.json
### Should Exit from Account In Not Trusted PC
    docker logout

## Push Local Image into Existing Account w/ Lattest Tag If Other Not Provided. Login Is Required. 
docker image push sergkritsa/nginx
## Push Local Image into Existing Account w/ Provided Tag. Login Is Required. Image ID Will Be the Same because of Image  Layers
docker image push sergkritsa/nginx:testing 