FROM node:10-slim
EXPOSE 3000
WORKDIR /node
COPY package*.json ./
RUN mkdir app && chown -R node:node .

# next commands will be executed as node 
USER node

RUN npm install && npm cache clean --force
WORKDIR /node/app

# change owner to node
COPY --chown=node:node . .

CMD ["node", "app.js"]



# FROM node:10-slim
# EXPOSE 3000
# WORKDIR /node
# COPY package*.json ./
# RUN npm install && npm cache clean --force
# WORKDIR /node/app
# COPY . .
# CMD ["node", "app.js"]