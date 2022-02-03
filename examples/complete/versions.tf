terraform {
  // required_version = ">= 0.12.0, < 0.14"
  required_version = ">= 0.14"

  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.7.1"
    }
  }
}

provider "kubernetes" {
  # Configuration options

config_path = "~/.kube/config"
}
