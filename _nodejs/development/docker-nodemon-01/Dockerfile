FROM node:10.15-slim as prod

ENV NODE_ENV=production

WORKDIR /app

COPY ./src/package.json ./src/package-lock*.json ./
RUN npm install && npm cache clean --force

COPY ./src .

CMD ["node", "./bin/www"]

FROM prod as nodemon
