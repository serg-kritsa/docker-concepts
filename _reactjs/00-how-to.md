## run tests inside container. image required
docker build -f Dockerfile.dev -t sergkritsa/reactjs-app .
docker run -it sergkritsa/reactjs-app npm run test

## run tests using docker-compose way
(1st terminal) docker-compose up
(2nd terminal) docker container exec -it reactjs_web_1 npm run test


## run in prod
docker build -t sergkritsa/reactjs-app-prod .
docker run --rm -it -p 8000:80 sergkritsa/reactjs-app-prod
curl http://localhost:8000