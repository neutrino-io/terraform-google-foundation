module "service_account-iam-bindings" {
  source  = "terraform-google-modules/iam/google//modules/service_accounts_iam"
  version = "~> 7.4"

  service_accounts = [
    google_service_account.service_account_provisioner.email
  ]
  project = module.app_project.project_id
  mode    = "additive"

  bindings = {
    "roles/iam.serviceAccountKeyAdmin" = [
      var.iam_impersonation_principle,
    ]

    "roles/iam.serviceAccountTokenCreator" = [
      var.iam_impersonation_principle,
    ],

    "roles/iam.serviceAccountUser" = [
      var.iam_impersonation_principle,
    ],

    "roles/iam.workloadIdentityUser" = [
      "principal://iam.googleapis.com/projects/${module.app_project.project_number}/locations/global/workloadIdentityPools/defaulr/subject/sub"
    ],
  }

  depends_on = [
    module.app_project,
    google_service_account.service_account_provisioner
  ]
}

module "service_account-project-iam-bindings" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 7.4"

  projects = [module.app_project.project_id]
  mode   = "authoritative"

  bindings = {
    "roles/resourcemanager.projectIamAdmin" = [
      local.sa_provisioner_principle,
    ],
    "roles/identityplatform.admin" = [
      local.sa_provisioner_principle,
    ],
    "roles/serviceusage.serviceUsageAdmin" = [
      local.sa_provisioner_principle,
    ],
    "roles/serviceusage.serviceUsageConsumer" = [
      local.sa_provisioner_principle,
    ],
    "roles/iam.serviceAccountAdmin" = [
      local.sa_provisioner_principle,
    ],
    "roles/container.admin" = [
      local.sa_provisioner_principle,
    ],
    "roles/compute.admin" = [
      local.sa_provisioner_principle,
    ],
    "roles/storage.admin" = [
      local.sa_provisioner_principle,
    ],
    "roles/cloudkms.admin" = [
      local.sa_provisioner_principle,
    ],
    "roles/artifactregistry.admin" = [
      local.sa_provisioner_principle,
    ],
    "roles/dns.admin" = [
      local.sa_provisioner_principle,
    ],
    "roles/firebase.admin" = [
      local.sa_provisioner_principle,
    ],
    "roles/appengine.appAdmin" = [
      local.sa_provisioner_principle,
    ],
    "roles/iap.admin" = [
      local.sa_provisioner_principle,
    ],
  }

  depends_on = [
    module.app_project,
    google_service_account.service_account_provisioner
  ]
}