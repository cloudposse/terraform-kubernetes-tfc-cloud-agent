resource "kubernetes_deployment" "tfc-agent" {
  metadata {
    name = var.deployment_name
    namespace = var.k8s_namespace
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
          image = var.tfc_agent_image
          name  = "tfc-agent"
          env {
            name  = "TFC_AGENT_TOKEN"
            value = var.tfc_agent_token
          }
          env {
            name  = "TFC_AGENT_NAME"
            value = var.tfc_agent_name
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