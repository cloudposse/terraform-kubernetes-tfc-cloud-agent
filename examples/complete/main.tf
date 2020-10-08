  provider "kubernetes" {
    version        = "~> 1.12"
  }

module "tfc_agent" {
  source = "../.."

  context = module.this.context
  token   = var.token
}
