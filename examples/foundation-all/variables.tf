variable "billing_account" {
  type        = string
  description = "The ID of the billing account to associate this project with"
}

variable "org_id" {
  type        = string
  description = "The ID of the organization to create the project in"
}

variable "iam_billing_principal" {
  type        = string
  description = "The principal to grant the billing role to"
}

variable "iam_organization_principal" {
  type        = string
  description = "The principal to grant the organization role to"
}
