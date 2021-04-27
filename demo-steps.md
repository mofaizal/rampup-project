
az aks get-credentials -n <yourClusterName> -g <yourResourceGroupName> 

kubectl config get-contexts

kubectl config use-context <yourClusterName>

kubectl port-forward svc/argocd-server -n argocd 8080:443

Create - to-do app using Argo-CD 
Show sync demo deployment via Argo CD

kubectl port-forward svc/frontendtodo 8081:80
kubectl port-forward svc/guestbook-ui 8081:80
gcr.io,github.com,storage.googleapis.com,*.googleapis.com,ghcr.io


Now deploy Gustbook application via Argo CD
Update Image to new version show the out of sycn in ArgoCD
Roll out the changes
Roll back the changes

Auto update

Canary Roll out

Blue Green Roll out
kubectl port-forward svc/rollout-bluegreen-active 8082:80
kubectl port-forward svc/rollout-bluegreen-preview 8083:80


kubectl patch svc fleetman-webapp -p '{"spec": {"type": "LoadBalancer"}}'


Istio Demo Steps

Istio CTL path set
export PATH=/home/faizal/rampup-project/istio/istio-1.9.3/bin:$PATH

istioctl dashboard kiali
istioctl dashboard jaeger
istioctl dashboard grafana
istioctl dashboard prometheus 

kubectl patch svc fleetman-webapp -p '{"spec": {"type": "LoadBalancer"}}'

kubectl port-forward -n istio-system svc/fleetman-webapp 8081:30081

kubectl port-forward -n istio-system svc/kiali 8081:20001

Install Zipkin

kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.9/samples/addons/extras/zipkin.yaml

kubectl port-forward -n istio-system svc/zipkin 8081:9411

DELETE TRAFIC Routing. 

while true; do curl -s http://Public-IP/ | grep title; slpee 0.5; done

while true; do curl -s http://10.0.128.232:32394/ | grep title; slpee 0.5; done
kubectl port-forward -n istio-system svc/istio-ingressgateway 8082:32394

while true; do curl 20.43.168.195/api/vehicle/driver/City%20Truck; echo; done


