
Create - to-do app using Argo-CD 
Show sync demo deployment via Argo CD

Show PODS
kgpod 
kgsvc
look for LB IP

Now deploy Gustbook application via Argo CD
Update Image to new version show the out of sycn in ArgoCD
Roll out the changes
Roll back the changes

Auto update

Canary Roll out

Blue Green Roll out

kubectl patch svc fleetman-webapp -p '{"spec": {"type": "LoadBalancer"}}'


Istio Demo Steps

kubectl patch svc fleetman-webapp -p '{"spec": {"type": "LoadBalancer"}}'

kubectl port-forward -n istio-system svc/kiali 8081:20001
Install Zipkin

kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.9/samples/addons/extras/zipkin.yaml

kubectl port-forward -n istio-system svc/zipkin 8081:9411
