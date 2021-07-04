# To enable BuildKit builds
# Easiest way from a fresh install of docker is to set the DOCKER_BUILDKIT=1 environment variable when invoking the docker build command, such as:
DOCKER_BUILDKIT=1 docker build .

# New docker build BuildKit TTY output will be applied
docker build . 
docker build --progress=plain . 