terraform {
  required_version = ">= 1.0.9"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.6.1"
    }
  }
}
