#! /bin/bash 

echo "Your nginx current version is: "
kubectl describe deployments | grep Image | awk '{print $2}'

sleep 5 

echo "deleting prevous index.html..."
sleep 2
kubectl delete configmap nginx-index-html-configmap 
echo "Creating an index.html..."
sleep 2
kubectl create configmap nginx-index-html-configmap --from-file=../deploy/index.html -o yaml

echo "Setting new container image ..."
sleep 2
kubectl set image deployment/my-nginx my-nginx=nginx:1.9.1 --record

sleep 5

echo "Your nginx current version is: "
kubectl describe deployments | grep Image | awk '{print $2}'


