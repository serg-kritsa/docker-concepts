## apply all configs in folder 
kubectl apply -f k8s
kubectl get deployments
kubectl get services

## get deployment log
kubectl logs deployment_name

## persistent volume claim. slice of hard drive by default
kubectl get storageclass
kubectl describe storageclass
[https://kubernates.io/docs/concepts/storage/storage-classes/#provisioner]
kubectl get pv
kubectl get pvc

## pass env variables
env variables should be passed as strings

## add secret
kubectl create secret generic pgpassword    --from-literal PGPASSWORD=pgpass123
                              <secret_name>                <key>     =<value>
kubectl get secrets