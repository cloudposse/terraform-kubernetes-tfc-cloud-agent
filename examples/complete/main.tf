provider "kubernetes" {
  config_path = "~/.kube/config"
}

module "tfc_agent" {
  source  = "../.."
  context = module.this.context

  tfc_agent_token = var.tfc_agent_token

  namespace_creation_enabled = true
  kubernetes_namespace       = "tfc-agent"
}
