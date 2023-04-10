[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/neutrino-io/terraform-google-foundation.svg?label=latest)](https://github.com/neutrino-io/terraform-google-foundation/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D1.0.x-blue.svg)

# Neutrino Platform Builder - GCP Foundation

## Pre Requisite
- Complete setup of Google Cloud Identity and organization.
- Login to GCP from CLI tool using `gcloud auth application-default login` before running terraform.
- Need to add following role for the user that execute from local.
  - Organization Administrator
  - Organization Policy Administrator
  - Billing Account Administrator
  - Folder Creator

## Post Deployment
- Manually enable the Identity Platform API in the GCP console at https://console.cloud.google.com/customer-identity
- Running post foundation setup script `PROJECT_ID=neutrino-develop-g1-f1f1f ACCOUNT_EMAIL=user@neutrino.sh IAP_SUPPORT_EMAIL=support@neutrino.sh APP_ORG_LABEL="Neutrino" ./foundation-post.sh`

## Deploying in Terraform Cloud

Neutrino Terraform module is using GCP impersonation to deploy the resources. Running in Terraform Cloud requires a setup
of Google Workload Identity Federation and integrate with Terraform OIDC. Typical process is as follows:

- Configuring Google Workload Identity Federation with a require pool and provider.
- Granting the Terraform Cloud service account access to the required pool.
- Configuring Terraform Cloud to use the OIDC provider.

Please follow the instructions in the following link for the detail process. https://developer.hashicorp.com/terraform/cloud-docs/workspaces/dynamic-provider-credentials/gcp-configuration

## Problem & Solutions

### Error reading or editing resources

```
Error: Error when reading or editing Resource "folder \"folders/$folder_id\"" with IAM Member: Role "roles/resourcemanager.projectCreator" Member "group:org-admins@example.net": Error retrieving IAM policy for folder "folders/$folder_id": Post "https://cloudresourcemanager.googleapis.com/v2/folders/$folder_id:getIamPolicy?alt=json&prettyPrint=false": oauth2: cannot fetch token: 400 Bad Request
Response: {
"error": "invalid_grant",
"error_description": "reauth related error (invalid_rapt)",
"error_subtype": "invalid_rapt"
}
```

The error might happen due to the application default credential has been overwritten by the service account credential.
To fix this issue, please run the following command to reset the application default credential

```
gcloud auth application-default login
```

## What's a Module?

A Module is a canonical, reusable, best-practices definition for how to run a single piece of infrastructure, such
as a database or server cluster. Each Module is written using a combination of [Terraform](https://www.terraform.io/)
and scripts (mostly bash) and include automated tests, documentation, and examples. It is maintained both by the open
source community and companies that provide commercial support.

Instead of figuring out the details of how to run a piece of infrastructure from scratch, you can reuse
existing code that has been proven in production. And instead of maintaining all that infrastructure code yourself,
you can leverage the work of the Module community to pick up infrastructure improvements through
a version number bump.

## Who maintains this Module?

This Module and its Submodules are maintained by [Nematix](https://nematix.com/). If you are looking for help or
commercial support, send an email to [support@nematix.com](mailto:support@nematix.com?Subject=Terraform%20Modules).

Nematix can help with:

- Setup, customization, and support for this Module.
- Modules and submodules for other types of infrastructure, such as VPCs, Docker clusters, databases, and continuous
  integration.
- Consulting & Training on AWS, Terraform, and DevOps.


## How is this Module versioned?

This Module follows the principles of [Semantic Versioning](http://semver.org/).

During initial development, the major version will be 0 (e.g., `0.x.y`), which indicates the code does not yet have a
stable API. Once we hit `1.0.0`, we will make every effort to maintain a backwards compatible API and use the MAJOR,
MINOR, and PATCH versions on each release to indicate any incompatibilities.

## License

Please see [LICENSE](https://github.com/neutrino-io/terraform-google-foundation/blob/master/LICENSE) for how the code in
this repo is licensed.