terraform {
  required_version = ">= 1.0.10"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.6.1"
    }
  }
}
