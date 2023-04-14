resource "random_string" "project_app_suffix" {
  length  = 5
  special = false
  upper   = false
}

locals {
  project_id_suffix        = "g1-${random_string.project_app_suffix.result}"
  project_id               = "${var.name}-${local.project_id_suffix}"
  sa_provisioner_id        = "provisioner"
  sa_provisioner_principle = "serviceAccount:${local.sa_provisioner_id}@${local.project_id}.iam.gserviceaccount.com"
}

module "app_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 14.2"

  org_id          = var.org_id
  folder_id       = var.folder_id
  name            = var.name
  project_id      = local.project_id
  billing_account = var.billing_account
  activate_apis   = var.activate_apis
}

resource "google_service_account" "service_account_provisioner" {
  account_id   = local.sa_provisioner_id
  display_name = "Cloud Provisioner"
  project      = module.app_project.project_id

  depends_on = [
    module.app_project
  ]
}

# Outputs
output "project_id" {
  value       = module.app_project.project_id
  description = "The ID of the created project."
}

output "project_name" {
  value       = module.app_project.project_name
  description = "The name of the created project."
}

output "project_number" {
  value       = module.app_project.project_number
  description = "The number of the created project."
}

output "service_account_provisioner_id" {
  value       = google_service_account.service_account_provisioner.id
  description = "The ID of the service account provisioner."
}

output "service_account_provisioner_email" {
  value       = google_service_account.service_account_provisioner.email
  description = "The email of the service account provisioner."
}
