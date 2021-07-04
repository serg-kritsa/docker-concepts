
## temporarily
docker run --init -d nodeapp

## permanent
RUN apk add --no-cache tini
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["node", "./bin/www"]

## js snipets
01-signal-handlers.js




