This article focuses on Kubernetes different deployment strategies and how to achieve them. We will also focus on the pros and cons of different deployment strategies.
There are several different types of deployment strategies you can take advantage of depending on your organization / application requirements goal.

RollingUpdate is the default strategy where Kubernetes creates a new ReplicaSet and starts scaling the new ReplicaSet up and simultaneously scaling the old ReplicaSet down. These strategy faces few limitation Inability to control traffic flow to the new version, Proper management of deployment images ensures rollback to any version without much of a fuzz, More features are can be deployed in production in less time.

kubectl create namespace argo-rollouts

kubectl apply -n argo-rollouts -f https://raw.githubusercontent.com/argoproj/argo-rollouts/stable/manifests/install.yaml

curl -LO https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-linux-amd64

chmod +x ./kubectl-argo-rollouts-linux-amd64

sudo mv ./kubectl-argo-rollouts-linux-amd64 /usr/local/bin/kubectl-argo-rollouts

kubectl argo rollouts version

Agro CD Deploy

kubectl argo rollouts get rollout rollouts-demo --watch

kubectl port-forward svc/rollouts-demo 8080:80
