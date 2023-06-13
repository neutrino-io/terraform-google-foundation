module "app-development-folder-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.app-folder-development.name]

  bindings = {

    "roles/compute.instanceAdmin.v1" = [
      var.iam_developer_principle,
    ]

    "roles/container.admin" = [
      var.iam_developer_principle,
    ]

    "roles/iam.serviceAccountUser" = [
      var.iam_developer_principle,
    ]

    "roles/iap.tunnelResourceAccessor" = [
      var.iam_developer_principle,
    ]

    "roles/bigquery.user" = [
      var.iam_developer_principle,
    ]

    "roles/dns.admin" = [
      var.iam_developer_principle,
    ],

  }
}


module "app-non-production-folder-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.app-folder-non-production.name]

  bindings = {

    "roles/compute.instanceAdmin.v1" = [
      var.iam_developer_principle,
    ]

    "roles/container.admin" = [
      var.iam_developer_principle,
    ]

  }
}

# Outputs for iam
output "iam-development" {
  value = module.app-development-folder-iam
}

output "iam-non-production" {
  value = module.app-non-production-folder-iam
}
