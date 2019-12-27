#! /bin/bash 

echo "Your nginx current version is: "
kubectl describe deployments | grep Image | awk '{print $2}'

sleep 5 

echo "Setting new container image ..."
sleep 2
kubectl set image deployment/my-nginx my-nginx=nginx:1.9.1 --record

sleep 5

echo "Your nginx current version is: "
kubectl describe deployments | grep Image | awk '{print $2}'


