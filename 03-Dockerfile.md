# Container Images and How To Build Them

## Building Images: The Dockerfile Basics
cd dockerfile-sample-1
vim Dockerfile

## Building Images: Running Docker Builds
docker image build -t customnginx .
docker image ls
## Building Images: Not Changed Layers Will Be Taken from Cache 
docker image build -t customnginx .

## Building Images: Extending Official Images
docker container run -p 80:80 --rm nginx
### from 2nd terminal for testing
    curl localhost
cd dockerfile-01-copy-file-into-image
docker image build -t nginx-with-html .
docker container run -p 80:80 --rm nginx-with-html
### from 2nd terminal for testing
    curl localhost
docker image ls


## Building Own Dockerfile and Run Containers From It
cd dockerfile-02-nodejs-app
docker build -t nodejsapp .
docker container run --rm -p 80:3000 nodejsapp
docker tag nodejsapp sergkritsa/nodejs-app-v1
docker push sergkritsa/nodejs-app-v1
docker image rm sergkritsa/nodejs-app-v1
docker container run --rm -p 80:3000 sergkritsa/nodejs-app-v1
