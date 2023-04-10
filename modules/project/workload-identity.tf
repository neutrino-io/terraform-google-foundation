resource "google_iam_workload_identity_pool" "default" {
  workload_identity_pool_id = "default"
  display_name              = "Default pool"
  project                   = module.app_project.project_id
}

resource "google_iam_workload_identity_pool_provider" "terraform-cloud" {
  count = var.enable_workload_id_terraform ? 1 : 0

  project                            = module.app_project.project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.default.workload_identity_pool_id
  workload_identity_pool_provider_id = "terraform-cloud"
  display_name                       = "OIDC identity pool for Terraform"
  attribute_condition                = "assertion.terraform_organization_id == \"${var.terraform_organization_id}\""
  attribute_mapping                  = {
    "google.subject"                        = "assertion.sub"
    "attribute.terraform_run_phase"         = "assertion.terraform_run_phase"
    "attribute.terraform_project_id"        = "assertion.terraform_project_id",
    "attribute.terraform_project_name"      = "assertion.terraform_project_name",
    "attribute.terraform_workspace_id"      = "assertion.terraform_workspace_id"
    "attribute.terraform_workspace_name"    = "assertion.terraform_workspace_name"
    "attribute.terraform_organization_id"   = "assertion.terraform_organization_id"
    "attribute.terraform_organization_name" = "assertion.terraform_organization_name"
    "attribute.terraform_run_id"            = "assertion.terraform_run_id"
    "attribute.terraform_full_workspace"    = "assertion.terraform_full_workspace"
  }

  oidc {
    issuer_uri = "https://app.terraform.io"
  }
}