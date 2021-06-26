# Exposing Kubernetes Ports

## Service Types
- ClusterIP
- - default
- - reachable within cluster (nodes & pods) 
- - pods can reach service on apps port number
- NodePort
- - high port allocated on each node
- - port is open on every node's IP
- - everyone can reach node
- LoadBalancer
- ExternalName

## Creating a ClusterIP Service
kubectl get pods -w
kubectl create deployment httpenv --image=bretfisher/httpenv
kubectl scale deployment/httpenv --replicas=2
kubectl expose --help
kubectl expose deployment/httpenv --port 8888
kubectl get service
### Windows Docker Desktop 
kubectl run mybash --rm -it --image bretfisher/netshoot -- bash
    curl httpenv:8888
### Linux
curl [ip of service]:8888
## Creating a NodePort Service. Default port should be in range 30000..32767
kubectl expose deployment/httpenv --port 8888 --name httpenv-np --type NodePort
kubectl get services
curl localhost:<NAME.PORT='httpenv-np.8888:#####/TCP>
kubectl delete service/httpenv-np
## Creating a LoadBalancer Service
kubectl expose deployment/httpenv --port 8888 --name httpenv-lb --type LoadBalancer
kubectl get services
curl localhost:8888
kubectl delete service/httpenv-lb service/httpenv

kubectl delete deployment httpenv

## Kubernetes Services DNS
curl <hostname>
kubectl get namespaces
curl <hostname>.<namespace>.svc.cluster.local

