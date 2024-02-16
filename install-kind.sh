#!/bin/bash

#check if kubectl is not installed and install it
if ! command -v kubectl  &> /dev/null; then
    echo "kubectl is not installed. Downloading..."
    #install kubectl
    sudo  curl -LO "https://dl.k8s.io/release/$(sudo curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
else
    echo "kubectl is already installed."
fi

#Install kind from binaries
if ! command -v kind  &> /dev/null; then
sudo curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.21.0/kind-linux-amd64
sudo chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
else
	echo "kind is already installed"
fi

#create k8s cluster
kind create cluster

#use kind context
kubectl cluster-info --context kind-kind

#install helm
sudo curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
sudo chmod +x  get_helm.sh
sudo ./get_helm.sh

echo "kind cluster successfully bootstrapped"
