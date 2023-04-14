[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/neutrino-io/terraform-google-foundation.svg?label=latest)](https://github.com/neutrino-io/terraform-google-foundation/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D1.0.x-blue.svg)

# Neutrino Platform Builder - GCP Foundation Project

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.61.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate_apis"></a> [activate\_apis](#input\_activate\_apis) | List of APIs to enable in the seed project. | `list(string)` | <pre>[<br>  "serviceusage.googleapis.com",<br>  "iamcredentials.googleapis.com",<br>  "serviceusage.googleapis.com",<br>  "servicenetworking.googleapis.com",<br>  "compute.googleapis.com",<br>  "logging.googleapis.com",<br>  "bigquery.googleapis.com",<br>  "cloudresourcemanager.googleapis.com",<br>  "cloudbilling.googleapis.com",<br>  "iam.googleapis.com",<br>  "admin.googleapis.com",<br>  "appengine.googleapis.com",<br>  "storage-api.googleapis.com",<br>  "monitoring.googleapis.com",<br>  "iap.googleapis.com"<br>]</pre> | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account to associate this project with | `string` | n/a | yes |
| <a name="input_enable_workload_id_terraform"></a> [enable\_workload\_id\_terraform](#input\_enable\_workload\_id\_terraform) | Enable Workload Identity for Terraform | `bool` | `false` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The folder ID for the associated services | `string` | n/a | yes |
| <a name="input_iam_impersonation_principle"></a> [iam\_impersonation\_principle](#input\_iam\_impersonation\_principle) | The principle to impersonate | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the project | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The organization ID for the associated services | `string` | n/a | yes |
| <a name="input_terraform_organization_id"></a> [terraform\_organization\_id](#input\_terraform\_organization\_id) | The organization ID for the associated services | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | The ID of the created project. |
| <a name="output_project_name"></a> [project\_name](#output\_project\_name) | The name of the created project. |
| <a name="output_project_number"></a> [project\_number](#output\_project\_number) | The number of the created project. |
| <a name="output_service_account_provisioner_email"></a> [service\_account\_provisioner\_email](#output\_service\_account\_provisioner\_email) | The email of the service account provisioner. |
| <a name="output_service_account_provisioner_id"></a> [service\_account\_provisioner\_id](#output\_service\_account\_provisioner\_id) | The ID of the service account provisioner. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Please see [LICENSE](https://github.com/neutrino-io/terraform-google-foundation/blob/master/LICENSE) for how the code in
this repo is licensed.
