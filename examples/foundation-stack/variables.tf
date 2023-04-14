variable "org_id" {
  type        = string
  description = "The organization ID"
}

variable "billing_account" {
  type        = string
  description = "The ID of the billing account to associate this project with"
}

variable "app_org_id" {
  type        = string
  description = "The application organization ID"
}

variable "app_org_label" {
  type        = string
  description = "The application organization label"
}
