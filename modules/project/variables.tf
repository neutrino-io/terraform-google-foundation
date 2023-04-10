variable "org_id" {
  description = "The organization ID for the associated services"
  type        = string
}

variable "folder_id" {
  description = "The folder ID for the associated services"
  type        = string
}

variable "name" {
  description = "The name of the project"
  type        = string
}

variable "billing_account" {
  description = "The ID of the billing account to associate this project with"
  type        = string
}

variable "iam_impersonation_principle" {
  description = "The principle to impersonate"
  type        = string
}


variable "activate_apis" {
  description = "List of APIs to enable in the seed project."
  type        = list(string)

  default = [
    "serviceusage.googleapis.com",
    "iamcredentials.googleapis.com",
    "serviceusage.googleapis.com",
    "servicenetworking.googleapis.com",
    "compute.googleapis.com",
    "logging.googleapis.com",
    "bigquery.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudbilling.googleapis.com",
    "iam.googleapis.com",
    "admin.googleapis.com",
    "appengine.googleapis.com",
    "storage-api.googleapis.com",
    "monitoring.googleapis.com",
    "iap.googleapis.com"
  ]
}

variable "enable_workload_id_terraform" {
  description = "Enable Workload Identity for Terraform"
  type        = bool
  default     = false
}

variable "terraform_organization_id" {
  description = "The organization ID for the associated services"
  type        = string
  default     = ""
}