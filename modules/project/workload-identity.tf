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
  attribute_mapping                  = {
    "google.subject"                      = "assertion.terraform_workspace_id"
  }
  attribute_condition = "assertion.terraform_organization_id == \"${var.terraform_organization_id}\""

  oidc {
    issuer_uri = "https://app.terraform.io"
  }
}