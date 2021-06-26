## Create Pod since v1.18
kubectl run my-nginx --image nginx
## Get Pod List
kubectl get pods
## Delete Pod
kubectl delete pods my-nginx

## Create Deployment since v1.18
kubectl create deployment my-nginx --image nginx
## Get info
kubectl get all
## Delete Deployment since v1.18
kubectl delete deployment my-nginx

## Scaling ReplicaSets since v1.18 
kubectl create deployment my-nginx --image nginx
kubectl scale deploy/my-nginx --replicas 2          [it will be 2 pods]
    kubectl scale deploy/my-nginx --replicas=2
        kubectl scale deployment my-nginx --replicas=3
kubectl get all
### Recreation in ReplicaSets
kubectl get pods -w
(2nd terminal) kubectl delete pod/my-nginx-<pod id>

## Inspecting Kubernetes Objects
kubectl get pods
kubectl get all
### Print log
kubectl logs deployment/my-nginx
### Print last line of log
kubectl logs deployment/my-nginx --tail 1
### Don't close log (Ctrl+C to exit)
kubectl logs deployment/my-nginx --follow --tail 1
### Print pod details
kubectl get pods
kubectl describe pod/my-nginx-<pod id>


kubectl logs -l run=my-nginx
