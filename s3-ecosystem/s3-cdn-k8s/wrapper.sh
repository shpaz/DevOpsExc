#! /bin/bash 

# create cache deployment 
for i in 'configmap' 'deployment';do kubectl create -f cache-${i}.yaml; done
sleep 15 

# gather pod ips from lb deployment 
POD1_IP=`kubectl get pods -o wide | grep "s3-cdn-cache" | awk '{print $6}' | head -n 1`
POD2_IP=`kubectl get pods -o wide | grep "s3-cdn-cache" | awk '{print $6}' | head -n 2 | tail -n 1`
POD3_IP=`kubectl get pods -o wide | grep "s3-cdn-cache" | awk '{print $6}' | tail -n 1`

sed -i "s/IP1/$POD1_IP/g" lb-deployment.yaml 
sed -i "s/IP2/$POD2_IP/g" lb-deployment.yaml
sed -i "s/IP3/$POD3_IP/g" lb-deployment.yaml

for i in 'configmap' 'deployment';do kubectl create -f lb-${i}.yaml; done
sleep 15



