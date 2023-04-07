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

variable "enable_common_stack" {
  description = "Whether to enable the common application stack"
  type        = bool
  default = true
}

variable "enable_default_stack" {
  description = "Whether to enable the default application stack"
  type        = bool
  default = false
}

variable "stack_name" {
  description = "The name of the default stack"
  type        = string
  default = ""
}

variable "stack_description" {
  description = "The description of the default stack"
  type        = string
  default = ""
}

variable "stack_label" {
  description = "The label of the default stack"
  type        = string
  default = ""
}

variable "stack_domain" {
  description = "The domain of the default stack"
  type        = string
  default = ""
}