#! /bin/bash 
echo "Deleting nginx deployment..."
sleep 2
kubectl delete -f nginx-deployment.yml
kubectl delete -f nginx-service.yml
