terraform {
  #  required_version = ">= 0.12.0, < 0.14.0"
  required_version = ">= 0.14.0"
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.7.1"
    }
  }
}



