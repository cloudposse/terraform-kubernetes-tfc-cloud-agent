output "service_account_name" {
  value       = module.tfc_agent.service_account_name
  description = "Name of the Kubernetes service account"
}

output "namespace" {
  value       = module.tfc_agent.namespace
  description = "Name of the Kubernetes namespace"
}
