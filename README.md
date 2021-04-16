# Faizal CAE RAMP-UP Project Playgroup

This repo contains a collection of codes to set up AKS Private Cluster, GitOps using ArgoCD, Istio, Kiali, and many more tools.

The code on this repo comes from following sources:

Terraform: 

GitOps: 

Istio: 

## Deployment

```bash
# Script to execute from bash shell

# Login to your Azure Active Directory tenant
az login -t {TENANTNID}

# Make sure you are using the right subscription
az account show -o table

# If you are not in the correct subscription, change it substituting SUBSCRIPTIONID with the proper subscription  id
az account set --subscription {SUBSCRIPTIONID}

# If you are running in Azure Cloud Shell, you need to run the following additional command:
export TF_VAR_logged_user_objectId=$(az ad signed-in-user show --query objectId -o tsv)

# Go to the AKS construction set folder 
cd enterprise_scale/construction_sets/aks

configuration_folder=online/aks_secure_baseline/configuration

# Define the configuration files to apply, all tfvars files within the above folder recursively
parameter_files=$(find $configuration_folder | grep .tfvars | sed 's/.*/-var-file &/' | xargs)

# Load the CAF module and related providers
terraform init -upgrade

# Trigger the deployment of the resources
eval terraform apply ${parameter_files}

```
You are done with deployment of AKS environment, next step is to deploy the application and reference components.

To get the credentials profile from your clusters issue following command 
```Azure CLI
az aks get-credentials -n <yourClusterName> -g <yourResourceGroupName>

For Admin profile 
az aks get-credentials --resource-group myResourceGroup --name myAKSCluster --admin

Use kubectl config get-contexts you will be seeing all the clusters you where authenticated against, regardless of the azure subscription
```Kubectl
kubectl config get-contexts
```

My case I have 2 x cluster in different azure subscription, to switch profile I  need to use the context use below command to switch context between the clusters. 
```kubectl
kubectl config use-context <yourClusterName>


To assign Admin role 

# Get the resource ID of your AKS cluster
AKS_CLUSTER=$(az aks show --resource-group rampup-rg-aks-re1 --name rampup-aks-akscluster-re1-001 --query id -o tsv)

# Get the account credentials for the logged in user
ACCOUNT_UPN=$(az account show --query user.name -o tsv)
ACCOUNT_ID=$(az ad user show --id $ACCOUNT_UPN --query objectId -o tsv)

# Assign the 'Cluster Admin' role to the user
az role assignment create \
    --assignee $ACCOUNT_ID \
    --scope $AKS_CLUSTER \
    --role "Azure Kubernetes Service Cluster Admin Role"

## Next step

:arrow_forward: [Deploy ArgoCD into AKS](./gitops.md)