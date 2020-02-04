## Quickstart 

* Run the helm deployment after changing the needed values in helm-consul-values.yaml file 
* Needed values are dc, replicas, bootstrap excpect, extra services config etc
``` helm install -f helm-consul-values.yaml consul ./consul-helm ```

* Verify the health checks are OK by running 'minikube service list', acess the consul ui url from the browser 

* After verifying all pods are up and running (all 3 servers) extract the consuls dns interface ip  
``` kubectl get svc consul-consul-dns -o jsonpath='{.spec.clusterIP}' ```

* Edit coredns configmap and add forwarding to consul dns clusterip
``` kubectl edit configmap coredns -n kube-system ```

* Run check-consul-reslove.yaml file to check dns resolv to that given service 
``` kubectl create -f check-consul-resolve.yaml ```
