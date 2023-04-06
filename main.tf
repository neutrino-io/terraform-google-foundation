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
  display_name = "Common"
  parent       = "organizations/${var.org_id}"

  depends_on = [
    module.organization-iam
  ]
}

# Common Project
module "common-project" {
  source = "./modules/common-project"
  org_id = var.org_id
  billing_account = var.billing_account
  folder_common_id = google_folder.common.name

  depends_on = [
    google_folder.common
  ]
}

# Common Network
module "common-network" {
  source = "./modules/common-network"
  vpc_host_dev_project_id = module.common-project.vpc_host_dev_project_id
  vpc_host_nonprod_project_id = module.common-project.vpc_host_nonprod_project_id
  vpc_host_prod_project_id = module.common-project.vpc_host_prod_project_id

  depends_on = [
    module.common-project
  ]
}