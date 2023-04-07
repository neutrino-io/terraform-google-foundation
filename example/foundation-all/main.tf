module "google_foundation" {
  source                     = "../../"
  billing_account            = var.billing_account
  org_id                     = var.org_id
  iam_billing_principal      = var.iam_billing_principal
  iam_organization_principal = var.iam_organization_principal
  enable_default_stack = true
  stack_name = "neutrino"
  stack_label = "Neutrino"
  stack_domain = "nematix.com"
}
