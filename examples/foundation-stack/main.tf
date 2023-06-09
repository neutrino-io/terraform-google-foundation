locals {
  org_domain               = "nematix.com"
  env_name_dev             = "develop"
  env_name_stag            = "staging"
  env_name_prod            = "production"
  project_name_prefix_dev  = "${var.app_org_id}-${local.env_name_dev}"
  project_name_prefix_stag = "${var.app_org_id}-${local.env_name_stag}"
  project_name_prefix_prod = "${var.app_org_id}-${local.env_name_prod}"
}

########################
# Stack folder
########################
module "foundation-stack-folder" {
  source                  = "../../modules/folder"
  org_id                  = var.org_id
  app_org_label           = var.app_org_label
  iam_developer_principle = "group:gcp-organization-admins@${local.org_domain}"
}


########################
# Development project
########################
module "foundation-stack-project-develop" {
  source = "../../modules/project"

  name                        = local.project_name_prefix_dev
  org_id                      = var.org_id
  folder_id                   = module.foundation-stack-folder.folder-development.id
  billing_account             = var.billing_account
  iam_impersonation_principle = "group:gcp-developers@${local.org_domain}"

  depends_on = [
    module.foundation-stack-folder
  ]
}


########################
# Staging project
########################
module "foundation-stack-project-staging" {
  source = "../../modules/project"

  name                        = local.project_name_prefix_stag
  org_id                      = var.org_id
  folder_id                   = module.foundation-stack-folder.folder-non-production.id
  billing_account             = var.billing_account
  iam_impersonation_principle = "group:gcp-developers@${local.org_domain}"

  depends_on = [
    module.foundation-stack-folder
  ]
}


########################
# Production project
########################
module "foundation-stack-project-production" {
  source = "../../modules/project"

  name                        = local.project_name_prefix_prod
  org_id                      = var.org_id
  folder_id                   = module.foundation-stack-folder.folder-production.id
  billing_account             = var.billing_account
  iam_impersonation_principle = "group:gcp-organization-admins@${local.org_domain}"

  depends_on = [
    module.foundation-stack-folder
  ]
}


# Foundation outputs
output "foundation-stack-project-develop" {
  value       = module.foundation-stack-project-develop
  description = "Development project"
}

output "foundation-stack-project-staging" {
  value       = module.foundation-stack-project-staging
  description = "Staging project"
}

output "foundation-stack-project-production" {
  value       = module.foundation-stack-project-production
  description = "Production project"
}
