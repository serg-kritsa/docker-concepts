FROM node:10-alpine
EXPOSE 3000
RUN apk add --no-cache tini

# OPTION 3, a custom code healthcheck that could
# do a lot more things then a simple curl
# or simply avoid needing curl to begin with
HEALTHCHECK --interval=30s CMD node hc.js


WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install && npm cache clean --force
COPY . .
ENTRYPOINT ["tini", "--"]
CMD ["node", "app.js"]
