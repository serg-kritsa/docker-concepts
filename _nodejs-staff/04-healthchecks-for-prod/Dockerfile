# https://docs.docker.com/engine/reference/builder/#healthcheck
# https://patrickleet.medium.com/effective-docker-healthchecks-for-node-js-b11577c3e595

FROM node:10-alpine
EXPOSE 3000
RUN apk add --no-cache tini curl


# OPTION 1, using curl to GET the default app url
# NOTE: ensure curl is installed in image
HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

# OPTION 2, using curl to GET a custom url with app logic
# NOTE: ensure curl is installed in image
HEALTHCHECK CMD curl -f http://localhost/healthz || exit 1


WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install && npm cache clean --force
COPY . .
ENTRYPOINT ["tini", "--"]
CMD ["node", "app.js"]
