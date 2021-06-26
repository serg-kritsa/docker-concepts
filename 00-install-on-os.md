# The Best Way to Set Up Docker for Your OS

http://get.docker.com
## Docker for Windows 10 Pro/Ent: Setup and Tips
docker version
docker ps
docker info

## Docker Toolbox for Windows 7, 8 and 10 Home: Setup and Tips
docker-machine help
docker-machine ls
docker-machine start
docker-machine ls
docker version
docker-machine env default

## Docker for Linux Setup and Tips
docker
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker bret
sudo docker version
docker version
sudo docker version
docker-machine version
http://github.com/docker/compose
http://github.com/docker/compose/releases
curl -L https://github.com/docker/compose/releases/download/1.15.0/docker-compose- `uname -s `- `uname -m` >/usr/local/bin/docker-compose
docker-compose version
http://github.com/docker/machine/releases
git clone https://github.com/Bretfisher/udemy-docker-mastery.git
docker image
docker image ls --

## Kubernetes Local Install
http://play-with-k8s.com
katacoda.com

### minikube
minikube-installer.exe
minikube start

### microk8s
microk8s.kubectl
microk8s.enable dns

in .bash_profile add `alias kubectl=microk8s.kubectl`

