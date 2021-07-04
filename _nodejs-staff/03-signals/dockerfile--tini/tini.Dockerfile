# this is an answer file for the Assignment
# move it up a directory for it to work
FROM node:10.15-alpine
EXPOSE 3000
# https://github.com/krallin/tini
RUN apk add --no-cache tini
WORKDIR /usr/src/app
COPY package.json  package-lock*.json ./
RUN npm install && npm cache clean --force
COPY . .
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["node", "app.js"]



# FROM
# EXPOSE
# RUN
# WORKDIR
# COPY
# RUN
# COPY
# ENTRYPOINT
# CMD
