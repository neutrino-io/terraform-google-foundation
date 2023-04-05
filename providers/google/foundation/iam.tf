module "organization-iam" {
  source  = "terraform-google-modules/iam/google//modules/organizations_iam"
  version = "~> 7.4"

  organizations = [var.org_id]

  bindings = {
    
    "roles/billing.admin" = [
      var.iam_billing_principal,
    ]
    
    "roles/resourcemanager.organizationAdmin" = [
      var.iam_organization_principal,
    ]
    
  }
}