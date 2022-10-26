# Techtrends project

## Instructions

Step 1: Install docker and create a Dockerfile. Follow the steps in docker_commands file

Step 2: Github actions: Continuous Integration with Github Actions
        1. Create a new repo
        2. push your codes to the new repo
        3. Add the docker token and GitHub encrypted secrets from the project directory Goto `settings` > `secret` > `Actions` > click `New repository secret`
        4. create the `techtrends-dockerhub.yml` in the `.github/workflows/` Might be created automatically when creating the github action.
        5. Goto `Github Actions` and click on the `create a new workflow yourself` button

Step 3: Kubernetetes Declarative Manifests 

## Deploy a Kubernetes cluster

Make sure your oracle VM Box is open

## create a vagrant box using the Vagrantfile in the current directory
`vagrant up`

## SSH into the vagrant box
`vagrant ssh`

## Deploy the Kubernetes cluster from the k3s documentation 
`curl -sfL https://get.k3s.io | sh - `

## Become super user kubeconfig 
`sudo su`

## Get all nodes 
`kubectl get no`

## create your Kubernetes Declarative Manifests file namespace.yaml, deploy.yaml and service.yaml
1. make a new file called namespace.yaml, deploy & service and copy the content from kubernetes folder
2. Apply the manifests


```

kubectl apply -f namespace.yaml
kubectl apply -f deploy.yaml
kubectl apply -f service.yaml

```
kubectl delete -f namespace.yaml

Get all Kubectl namespace 

`` kubectl get all -n sandbox ``

Get all running pods 
`` kubectl get po -A ``

Step 4: Helm Charts

1. create the folder templates/ and add all requires files.
2. create the chart.yaml, values.yaml etc 

Step 5: Continuous Delivery with ArgoCD

1. install ArgoCD in your VM Box

```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

## get all pods

`` kubectl get po -n argocd ``

## get all services

`` kubectl get svc -n argocd ``

Now we need to expose it to the internet
First, you need to get the argocd-server from the list of service 
and copy the yaml ` argocd-server-nodeport.yaml` from here https://github.com/udacity/nd064_course_1/blob/main/solutions/argocd/argocd-server-nodeport.yaml 

`` kubectl get svc -n argocd `` again 

then access the ArgoCD UI by going to https://192.168.56.4:30008 or http://192.168.56.4:30007

Create 2 files called helm-techtrends-prod.yaml and helm-techtrends-staging.yaml and copy the contents from argocd folder