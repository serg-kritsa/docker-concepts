FROM node:10.15-alpine

# this app listens on port 3000, but the container should launch on port 80
EXPOSE 3000

# https://github.com/krallin/tini
# to use alpine package manager to install tini:
RUN apk add --no-cache tini

# to create directory /usr/src/app for app files with 'mkdir -p /usr/src/app'
WORKDIR /usr/src/app
# to copy "package manager" files in container
COPY package.json  package-lock*.json ./
# to run 'npm install' to install dependencies from that file
# to keep it clean and small, run 'npm cache clean --force' after above
RUN npm install && npm cache clean --force

# copy in all files from current directory in container
COPY . .

# to run w/ tini
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
