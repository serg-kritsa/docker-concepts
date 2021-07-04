FROM node:10.15-slim

ENV NODE_ENV=production

WORKDIR /app

COPY ./src/package.json ./src/package-lock*.json ./
RUN npm install && npm cache clean --force

COPY ./src .

CMD ["node", "./bin/www"]

# extend $PATH to run `nodemon` w/o /full/path/to/
ENV PATH /app/node_modules/.bin/:$PATH
