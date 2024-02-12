#!/bin/bash

#Install kind from binaries
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.21.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

#create k8s cluster
kind create cluster

#set kubeconfig env var for terraform to confer from
export KUBE_CONFIG_PATH=$(cat "${HOME}/.kube/config")

#check if kubectl is already installed
if [ ! command -v kubectl &> /dev/null ]; then
    echo "kubectl is not installed. Downloading..."
    #install kubectl
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
else
    echo "kubectl is already installed."
fi

#install helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

echo "kind cluster successfully bootstrapped"