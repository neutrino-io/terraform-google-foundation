module "service_account-iam-bindings" {
  source  = "terraform-google-modules/iam/google//modules/service_accounts_iam"
  version = "~> 7.4"

  service_accounts = [
    google_service_account.service_account_provisioner.email
  ]

  project = var.project_id
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

  }

  depends_on = [
    google_service_account.service_account_provisioner
  ]
}

module "service_account-project-iam-bindings" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 7.4"
  projects = [var.project_id]
  mode   = "additive"

  bindings = {
    "roles/resourcemanager.projectIamAdmin" = [
      "serviceAccount:${google_service_account.service_account_provisioner.email}",
    ],
    "roles/identityplatform.admin" = [
      "serviceAccount:${google_service_account.service_account_provisioner.email}",
    ],
    "roles/serviceusage.serviceUsageAdmin" = [
      "serviceAccount:${google_service_account.service_account_provisioner.email}",
    ],
    "roles/serviceusage.serviceUsageConsumer" = [
      "serviceAccount:${google_service_account.service_account_provisioner.email}",
    ],
    "roles/iam.serviceAccountAdmin" = [
      "serviceAccount:${google_service_account.service_account_provisioner.email}",
    ],
    "roles/container.admin" = [
      "serviceAccount:${google_service_account.service_account_provisioner.email}",
    ],
    "roles/compute.admin" = [
      "serviceAccount:${google_service_account.service_account_provisioner.email}",
    ],
    "roles/storage.admin" = [
      "serviceAccount:${google_service_account.service_account_provisioner.email}",
    ],
    "roles/cloudkms.admin" = [
      "serviceAccount:${google_service_account.service_account_provisioner.email}",
    ],
    "roles/artifactregistry.admin" = [
      "serviceAccount:${google_service_account.service_account_provisioner.email}",
    ],
    "roles/dns.admin" = [
      "serviceAccount:${google_service_account.service_account_provisioner.email}",
    ],
    "roles/firebase.admin" = [
      "serviceAccount:${google_service_account.service_account_provisioner.email}",
    ],
    "roles/appengine.appAdmin" = [
      "serviceAccount:${google_service_account.service_account_provisioner.email}",
    ],
    "roles/iap.admin" = [
      "serviceAccount:${google_service_account.service_account_provisioner.email}",
    ],
  }
}