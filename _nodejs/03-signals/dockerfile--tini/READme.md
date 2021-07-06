
## Workaround for not existing file
COPY package.json package-lock*.json ./
    *   not throw error if not exists

cd /path/to/Dockerfile
## Build from Dockerfile
docker image build -t tini-dockerfile -f tini.Dockerfile .
docker image build -t tini-no-dockerfile -f tini.no.Dockerfile .

### May be built with tag
docker image build -t tini-dockerfile:no-tini .

## Run no tini container
docker run -p 81:3000 -d tini-no-dockerfile
docker top ###
    UID                 ...                CMD
    root                ...                node app.js

## Run tini container
docker run -p 80:3000 -d tini-dockerfile
docker top ###
    UID                 ...                CMD
    root                ...                sbin/tini -- node app.js
    root                ...                node app.js

## Run --init container. injected runtime
docker run --init -p 82:3000 -d tini-no-dockerfile
docker top ###
    UID                 ...                CMD
    root                ...                /sbin/docker-init -- node app.js
    root                ...                node app.js

