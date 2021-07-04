# syntax = docker/dockerfile:1
FROM alpine
# https://docs.docker.com/develop/develop-images/build_enhancements/#using-ssh-to-access-private-data-in-builds

# https://docs.docker.com/engine/reference/builder/#syntax

# Install ssh client and git
RUN apk add --no-cache openssh-client git

# Download public key for github.com
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

# Clone private repository
RUN --mount=type=ssh git clone git@github.com:youruser/privaterepo.git

