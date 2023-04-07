resource "random_string" "project_app_suffix" {
  length  = 5
  special = false
  upper   = false
}

locals {
  org_domain = "nematix.com"
  env_name_dev = "develop"
  env_name_stag = "staging"
  env_name_prod = "production"
  project_id_suffix = "g1-${random_string.project_app_suffix.result}"
  project_name_prefix_dev = "${var.app_org_id}-${local.env_name_dev}"
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
  project_id                  = "${local.project_name_prefix_dev}-${local.project_id_suffix}"
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
  project_id                  = "${local.project_name_prefix_stag}-${local.project_id_suffix}"
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
  project_id                  = "${local.project_name_prefix_prod}-${local.project_id_suffix}"
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
  value = module.foundation-stack-project-develop
}

output "foundation-stack-project-staging" {
  value = module.foundation-stack-project-staging
}

output "foundation-stack-project-production" {
  value = module.foundation-stack-project-production
}
