module "google_foundation" {
  source                     = "../../"
  billing_account            = var.billing_account
  org_id                     = var.org_id
  iam_billing_principal      = var.iam_billing_principal
  iam_organization_principal = var.iam_organization_principal
  org_domain                 = "neutrino.sh"
}

# Outputs
output "org_id" {
  value = module.google_foundation.org_id
}
