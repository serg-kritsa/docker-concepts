# base stage
FROM node:8-slim as base
LABEL org.opencontainers.image.authors=serg.kritsa
LABEL org.opencontainers.image.title="Node.js Dockerfile"
LABEL org.opencontainers.image.licenses=MIT
LABEL com.bretfisher.nodeversion=$NODE_VERSION
ENV NODE_ENV=production
EXPOSE 80
ENV PORT 80
WORKDIR /app
COPY package*.json ./
RUN npm config list
# `npm ci` to install production dependencies
RUN npm ci \
    && npm cache clean --force
ENV PATH /app/node_modules/.bin:$PATH
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]
CMD ["node", "server.js"]

# dev stage
FROM base as dev
ENV NODE_ENV=development
RUN apt-get update -qq && apt-get install -qy \ 
    ca-certificates \
    bzip2 \
    curl \
    libfontconfig \
    --no-install-recommends
RUN npm config list
RUN npm install --only=development \
    && npm cache clean --force
USER node
# /app/node_modules/.bin extended to PATH in base ## to use nodemon 
CMD ["nodemon", "server.js"]

# test stage
FROM dev as test
COPY . .
# RUN npm audit
# DEPRICATED microscanner
# ARG MICROSCANNER_TOKEN
# ADD https://get.aquasec.com/microscanner /
USER root
# RUN chmod +x /microscanner
# RUN /microscanner $MICROSCANNER_TOKEN --continue-on-failure

# pre-prod stage
FROM test as pre-prod
RUN rm -rf ./tests && rm -rf ./node_modules

# prod stage
FROM base as prod
# `COPY --from` to get it into other stages
COPY --from=pre-prod /app /app
HEALTHCHECK CMD curl http://127.0.0.1/ || exit 1
USER node
