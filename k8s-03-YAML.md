# Moving to Declarative Kubernetes YAML

## Kubectl Apply
kubectl apply -f myyaml/
kubectl apply -f k8s-yaml/app.yaml
kubectl get all
kubectl delete service/app-nginx-service deployment/app-nginx-deployment

### Apply from web
kubectl apply -f https://bret.run/pod.yml
curl -L https://bret.run/pod
start https://bret.run/pod.yml

## Building Your YAML Files
kubectl api-resources
kubectl api-versions

## dry-run Generators
kubectl create deployment mynginx --image nginx --dry-run=client
kubectl create deployment mynginx --image nginx --dry-run -o yaml

kubectl create job test --image nginx --dry-run=client
kubectl create job test --image nginx --dry-run -o yaml

### Wrong way. Deployment should be
kubectl expose deployment/test --port 80 --dry-run=client -o -yaml
### Work way
kubectl create deployment test --image nginx
kubectl expose deployment/test --port 80 --dry-run=client -o json
kubectl delete deployment test

## Dry Runs and Diffs
kubectl apply -f app.yml --dry-run
kubectl apply -f app.yml --server-dry-run
kubectl diff -f app.yml

## Labels and Label Selectors
kubectl get pods -l app=nginx
kubectl apply -f myfile.yaml -l app=nginx
kubectl get all
kubectl delete <resource type>/<resource name>



