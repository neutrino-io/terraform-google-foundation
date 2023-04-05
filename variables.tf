variable "billing_account" {
  description = "The ID of the billing account to associate projects with"
  type        = string
}

variable "org_id" {
  description = "The organization id for the associated resources"
  type        = string
}

variable "iam_billing_principal" {
  description = "The principal to grant billing access to"
  type        = string
}

variable "iam_organization_principal" {
  description = "The principal to grant organization access to"
  type        = string
}