terraform {
  required_providers {

    helm = {
      source = "hashicorp/helm"
      version = "2.12.1"
    }

    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }

   kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.25.2"
    }

  }
}

provider "helm" {
  # terraform will source the config from the KUBE_CONFIG_PATH variable set from the bash script
}

provider "kubectl" {
  # terraform will source the config from the KUBE_CONFIG_PATH variable set from the bash script
}

provider "kubernetes" {
  # terraform will source the config from the KUBE_CONFIG_PATH variable set from the bash script
}