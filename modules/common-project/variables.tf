variable "org_id" {
  description = "The organization id for the associated services"
  type        = string
}

variable "billing_account" {
  description = "The ID of the billing account to associate this project with"
  type        = string
}

variable "folder_common_id" {
  description = "The folder id for the associated services"
  type        = string
}

variable "project_suffix_generation" {
  description = "The generation suffix to use for the project ID"
  type        = string
  default     = "g1"
}
