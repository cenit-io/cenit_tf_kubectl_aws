provider "aws" {
  region = var.region
}

provider "kubernetes" {
  config_path = var.path_kubectl
}

provider "helm" {
  kubernetes {
    config_path = var.path_kubectl
  }
}

provider "kubectl" {
  kubernetes {
    config_path = var.path_kubectl
  }
}

