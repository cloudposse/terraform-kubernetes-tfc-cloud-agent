output "service_account_name" {
  value       = local.service_account_name
  description = "Name of the Kubernetes service account"
}

output "namespace" {
  value       = local.namespace
  description = "Name of the Kubernetes namespace"
}
