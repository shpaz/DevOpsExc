#! /bin/bash 

echo "Creating an index.html..."
sleep 2
kubectl create configmap nginx-index-html-configmap --from-file=index.html -o yaml  

echo "Running nginx deployment..."
sleep 2
kubectl create -f nginx-deployment.yml

echo "exposing nginx deployment..."
sleep 2
kubectl create -f nginx-service.yml

sleep 2 
echo "your nginx server url is: "
minikube service my-nginx --url
