
## Workaround for not existing file
COPY package.json package-lock*.json ./
    *   not throw error if not exists

cd path/to/folder/where/docker-compose.yml
## Run injected init w/ docker-compose.yml
docker compose up -d
docker top ###
    UID                 ...                CMD
    root                ...                /sbin/docker-init -- docker-entrypoint.sh node app.js
    root                ...                node app.js

docker compose down 