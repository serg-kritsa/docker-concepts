# https://docs.docker.com/develop/develop-images/build_enhancements/#new-docker-build-secret-information

# https://docs.docker.com/engine/reference/builder/#syntax
# syntax=docker/dockerfile:1.2

FROM alpine

# shows secret from default secret location:
RUN --mount=type=secret,id=mysecret cat /run/secrets/mysecret

# shows secret from custom secret location:
RUN --mount=type=secret,id=mysecret,dst=/foobar cat /foobar