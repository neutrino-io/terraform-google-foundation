module "google_foundation" {
  source                     = "../../"
  billing_account            = var.billing_account
  org_id                     = var.org_id
  org_domain                 = "nematix.com"
  iam_billing_principal      = var.iam_billing_principal
  iam_organization_principal = var.iam_organization_principal
  enable_default_stack       = true
  stack_name                 = "neutrino"
  stack_label                = "Neutrino"
}

# Foundation outputs
output "org_id" {
  value       = module.google_foundation.org_id
  description = "The organization ID"
}

output "common-project-id" {
  value       = module.google_foundation.common-project
  description = "The common project ID"
}

output "foundation-stack-project-develop" {
  value       = module.google_foundation.foundation-stack-project-develop
  description = "The foundation stack project developer"
}

output "foundation-stack-project-staging" {
  value       = module.google_foundation.foundation-stack-project-staging
  description = "The foundation stack project staging"
}

output "foundation-stack-project-production" {
  value       = module.google_foundation.foundation-stack-project-production
  description = "The foundation stack project production"
}
