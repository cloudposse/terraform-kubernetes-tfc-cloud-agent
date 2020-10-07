variable "deployment_name" {
  type    = string
  default = "tfc-agent"
}

variable "k8s_namespace" {
  type        = string
  default     = "default"
  description = "Kubernetes namespace to deploy agent within"
}

variable "labels" {
  type    = map
  default = {
    app   = "tfc-agent"
  }
}

variable "selector_match_labels" {
  type    = map
  default = {
    app = "tfc-agent"
  }
}

variable "replicas" {
  type    = number
  default = 1
}

variable "annotations" {
  type    = map
  default = {
    "sidecar.istio.io/inject" = "false"
  }
}

variable "tfc_agent_image" {
  type        = string
  description = "Name and tag of TFC agent docker image"
  default     = "hashicorp/tfc-agent:latest"
}

variable "tfc_agent_name" {
  type = string
}

variable "tfc_agent_token" {
  type = string
}