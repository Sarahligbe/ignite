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
  kubernetes {
    config_path = pathexpand(var.cluster_config_path)
  }
}

provider "kubectl" {
  config_path = pathexpand(var.cluster_config_path)
}

provider "kubernetes" {
  config_path = pathexpand(var.cluster_config_path)
}
