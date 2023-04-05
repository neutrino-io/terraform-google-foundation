resource "random_string" "project_suffix" {
  length  = 5
  special = false
  upper   = false

  keepers = {
    generation = var.project_suffix_generation
  }
}


## Common Projects

module "logging" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "logging"
  project_id = "logging-${var.project_suffix_generation}-${random_string.project_suffix.result}"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "monitoring-dev" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "monitoring-dev"
  project_id = "monitoring-dev-${var.project_suffix_generation}-${random_string.project_suffix.result}"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "monitoring-nonprod" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "monitoring-nonprod"
  project_id = "monitoring-nonprod-${var.project_suffix_generation}-${random_string.project_suffix.result}"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "monitoring-prod" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "monitoring-prod"
  project_id = "monitoring-prod-${var.project_suffix_generation}-${random_string.project_suffix.result}"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "vpc-host-dev" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "vpc-host-dev"
  project_id = "vpc-host-dev-${var.project_suffix_generation}-${random_string.project_suffix.result}"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  enable_shared_vpc_host_project = true
  billing_account = var.billing_account
}

module "vpc-host-nonprod" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "vpc-host-nonprod"
  project_id = "vpc-host-nonprod-${var.project_suffix_generation}-${random_string.project_suffix.result}"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  enable_shared_vpc_host_project = true
  billing_account = var.billing_account
}

module "vpc-host-prod" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "vpc-host-prod"
  project_id = "vpc-host-prod-${var.project_suffix_generation}-${random_string.project_suffix.result}"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  enable_shared_vpc_host_project = true
  billing_account = var.billing_account
}

# Outputs
output "logging_project_id" {
  value = module.logging.project_id
}

output "monitoring_dev_project_id" {
  value = module.monitoring-dev.project_id
}

output "monitoring_nonprod_project_id" {
  value = module.monitoring-nonprod.project_id
}

output "monitoring_prod_project_id" {
  value = module.monitoring-prod.project_id
}

output "vpc_host_dev_project_id" {
  value = module.vpc-host-dev.project_id
}

output "vpc_host_nonprod_project_id" {
  value = module.vpc-host-nonprod.project_id
}

output "vpc_host_prod_project_id" {
  value = module.vpc-host-prod.project_id
}