locals {
  org_domain = var.org_domain != "" ? var.org_domain : "neutrino.sh"
  env_name_dev = "develop"
  env_name_stag = "staging"
  env_name_prod = "production"

  stack_name = var.stack_name != "" ? var.stack_name : "neutrino"
  stack_label = var.stack_label != "" ? var.stack_label : "Neutrino"

  project_name_prefix_dev = "${local.stack_name}-${local.env_name_dev}"
  project_name_prefix_stag = "${local.stack_name}-${local.env_name_stag}"
  project_name_prefix_prod = "${local.stack_name}-${local.env_name_prod}"
}

# Organization IAM
module "organization-iam" {
  source  = "terraform-google-modules/iam/google//modules/organizations_iam"
  version = "~> 7.4"

  organizations = [var.org_id]

  bindings = {
    
    "roles/billing.admin" = [
      var.iam_billing_principal,
    ]
    
    "roles/resourcemanager.organizationAdmin" = [
      var.iam_organization_principal,
    ]
    
  }
}

# Common Folder
resource "google_folder" "common" {
  count = var.enable_common_stack ? 1 : 0

  display_name = "Common"
  parent       = "organizations/${var.org_id}"

  depends_on = [
    module.organization-iam
  ]
}

# Common Project
module "common-project" {
  count = var.enable_common_stack && length(google_folder.common) > 0 ? 1 : 0

  source = "./modules/common-project"
  org_id = var.org_id
  billing_account = var.billing_account
  folder_common_id = google_folder.common[count.index].name

  depends_on = [
    google_folder.common
  ]
}

# Common Network
module "common-network" {
  count = var.enable_common_stack && length(module.common-project) > 0 ? 1 : 0

  source = "./modules/common-network"
  vpc_host_dev_project_id = module.common-project[count.index].vpc_host_dev_project_id
  vpc_host_nonprod_project_id = module.common-project[count.index].vpc_host_nonprod_project_id
  vpc_host_prod_project_id = module.common-project[count.index].vpc_host_prod_project_id

  depends_on = [
    module.common-project
  ]
}

# Stack Folder
module "foundation-stack-folder" {
  count = var.enable_default_stack ? 1 : 0

  source                  = "./modules/folder"
  org_id                  = var.org_id
  app_org_label           = local.stack_label
  iam_developer_principle = "group:gcp-organization-admins@${local.org_domain}"
}

# Stack Development Project
module "foundation-stack-project-develop" {
  count = var.enable_default_stack && length(module.foundation-stack-folder) > 0 ? 1 : 0
  source = "./modules/project"

  name                        = local.project_name_prefix_dev
  org_id                      = var.org_id
  folder_id                   = module.foundation-stack-folder[count.index].folder-development.id
  billing_account             = var.billing_account
  iam_impersonation_principle = "group:gcp-developers@${local.org_domain}"

  depends_on = [
    module.foundation-stack-folder
  ]
}

# Stack Staging Project
module "foundation-stack-project-staging" {
  count = var.enable_default_stack && length(module.foundation-stack-folder) > 0 ? 1 : 0
  source = "./modules/project"

  name                        = local.project_name_prefix_stag
  org_id                      = var.org_id
  folder_id                   = module.foundation-stack-folder[count.index].folder-non-production.id
  billing_account             = var.billing_account
  iam_impersonation_principle = "group:gcp-developers@${local.org_domain}"

  depends_on = [
    module.foundation-stack-folder
  ]
}

# Stack Production Project
module "foundation-stack-project-production" {
  count = var.enable_default_stack && length(module.foundation-stack-folder) > 0 ? 1 : 0
  source = "./modules/project"

  name                        = local.project_name_prefix_prod
  org_id                      = var.org_id
  folder_id                   = module.foundation-stack-folder[count.index].folder-production.id
  billing_account             = var.billing_account
  iam_impersonation_principle = "group:gcp-organization-admins@${local.org_domain}"

  depends_on = [
    module.foundation-stack-folder
  ]
}


# Outputs
output "common-project" {
  value = module.common-project
}

output "common-network" {
  value = module.common-network
}

output "foundation-stack-folder" {
  value = module.foundation-stack-folder
}

output "foundation-stack-project-develop" {
  value = module.foundation-stack-project-develop
}

output "foundation-stack-project-staging" {
  value = module.foundation-stack-project-staging
}

output "foundation-stack-project-production" {
  value = module.foundation-stack-project-production
}