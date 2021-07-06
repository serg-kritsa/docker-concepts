# Nodemon
in WINDOWS DON'T work polling for container w/o `nodemon -L`

## before all
cd src && untar src.7z

## install modules inside compose
docker compose run express npm install

## check nodemon 
ls src/node_modules/.bin/

## build image
docker compose build
### if necessary to re-build image w/o cache
docker compose build --no-cache

## start container
docker compose up

## just a reminder
rm -r .\src\node_modules\    
docker compose down
docker image rm development_express 

### start app in background mode
docker compose up -d
### terminal inside running container
docker compose exec express bash
