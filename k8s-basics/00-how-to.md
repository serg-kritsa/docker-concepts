## run objects
kubectl apply -f simplek8s\client-pod.yaml
kubectl get pods
kubectl apply -f simplek8s\client-node-port.yaml
> spec.port.nodePort should be in range `30000..32767` 
kubectl get services
kubectl apply -f simplek8s\client-deployment.yaml
kubectl get deployments

## force to pull image from docker hub
cd /path/to/image/
docker build -t sergkritsa/multi-client:v5 .
docker push sergkritsa/multi-client:v5
kubectl set image  deployment/client-deployment client    =sergkritsa/multi-client:v5
            <prop> <obj_type>/<obj_name>       <cont_name>=<new_image_to_use>
