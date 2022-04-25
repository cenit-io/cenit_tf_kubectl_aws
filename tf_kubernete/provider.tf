provider "aws" {
  region = "eu-central-1"
}

provider "kubernetes" {
  config_path = "./../kubeconfig.yaml"
}

provider "helm" {
  kubernetes {
    config_path = "./../kubeconfig.yaml"
  }
}

provider "kubectl" {
  kubernetes {
    config_path = "./../kubeconfig.yaml"
  }
}

