resource "kubernetes_deployment" "tfc-agent" {
  count = module.this.enabled ? 1 : 0

  metadata {
    name = var.deployment_name
    namespace = var.kubernetes_namespace
    labels = var.labels
  }
  spec {
    selector {
      match_labels = var.selector_match_labels
    }
    replicas = var.replicas

    template {
      metadata {
        labels = var.labels
        annotations = var.annotations
      }
      spec {
        container {
          image = var.agent_image
          name  = "tfc-agent"
          env {
            name  = "TFC_AGENT_TOKEN"
            value = var.token
          }
          env {
            name  = "TFC_AGENT_NAME"
            value = module.this.id
          }
          resources {
            limits {
              cpu    = var.resource_limits_cpu
              memory = var.resource_limits_memory
            }
            requests {
              cpu    = var.resource_requests_cpu
              memory = var.resource_requests_memory
            }
          }
        }
      }
    }
  }
}