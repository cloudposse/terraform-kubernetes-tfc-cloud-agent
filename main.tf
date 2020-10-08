resource "kubernetes_service_account" "service_account" {
  count = module.this.enabled ? 1 : 0

  metadata {
    name        = var.deployment_name
    namespace   = var.kubernetes_namespace
    annotations = var.service_account_annotations
  }
}

resource "kubernetes_deployment" "tfc_cloud_agent" {
  count = module.this.enabled ? 1 : 0

  metadata {
    name      = var.deployment_name
    namespace = var.kubernetes_namespace
    labels    = var.labels
  }
  spec {
    selector {
      match_labels = var.selector_match_labels
    }
    replicas = var.replicas

    template {
      metadata {
        labels      = var.labels
        annotations = var.deployment_annotations
      }
      spec {
        service_account_name = kubernetes_service_account.service_account.0.metadata.0.name
        automount_service_account_token = true
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
              cpu    = "1"
              memory = "512Mi"
            }
            requests {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}