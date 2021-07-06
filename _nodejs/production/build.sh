docker build -t imagename:dev --target dev .
docker build -t imagename:test --target test .
  #       npm audit && npm audit fix           will causes issues ## 
docker build -t imagename:prod --target prod .
docker image ls

docker run --init imagename:test
docker run --init imagename:prod

docker compose up
  curl http://localhost:5000
  curl http://localhost:5001
  # perform a functional test across containers. After a moment delay, it should pass.
  docker-compose exec result ./tests/tests.sh


docker run -it imagename:prod bash
  ls /app/node_modules/.bin # it should not contain `nodemon` or devDependencies.
  ls /app # it should not contain `./tests` directory.

