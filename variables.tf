variable "deployment_name" {
  type        = string
  default     = "tfc-agent"
  description = "Name of the deployment in Kubernetes"
}

variable "kubernetes_namespace" {
  type        = string
  default     = "default"
  description = "Kubernetes namespace to deploy agent within"
}

variable "labels" {
  type    = map
  default = {
    app   = "tfc-agent"
  }
  description = "Labels to apply to the Kubernetes deployment"
}

variable "selector_match_labels" {
  type    = map
  default = {
    app = "tfc-agent"
  }
  description = "Selector labels to match on the Kubernetes deployment"
}

variable "replicas" {
  type    = number
  default = 1
  description = "Number of replicas in the Kubernetes deployment"
}

variable "annotations" {
  type    = map
  default = {}
  description = "Annotations to add to the Kubernetes deployment"
}

variable "agent_image" {
  type        = string
  default     = "hashicorp/tfc-agent:latest"
  description = "Name and tag of Terraform Cloud Agent docker image"
}

variable "token" {
  type        = string
  default     = ""
  description = "The agent token, as configured in Terraform Cloud"
}
