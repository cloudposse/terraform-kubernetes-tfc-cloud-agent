provider "kubernetes" {
  version        = "~> 1.12"
}

module "tfc_agent" {
  source = "../.."

  context = module.this.context
  token   = var.tfc_agent_token
}

