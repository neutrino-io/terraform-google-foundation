[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/neutrino-io/terraform-google-foundation.svg?label=latest)](https://github.com/neutrino-io/terraform-google-foundation/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D1.0.x-blue.svg)

# Neutrino Platform Builder - GCP Foundation Common Project

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account to associate this project with | `string` | n/a | yes |
| <a name="input_folder_common_id"></a> [folder\_common\_id](#input\_folder\_common\_id) | The folder id for the associated services | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The organization id for the associated services | `string` | n/a | yes |
| <a name="input_project_suffix_generation"></a> [project\_suffix\_generation](#input\_project\_suffix\_generation) | The generation suffix to use for the project ID | `string` | `"g1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_logging_project_id"></a> [logging\_project\_id](#output\_logging\_project\_id) | The project ID of the logging project. |
| <a name="output_monitoring_dev_project_id"></a> [monitoring\_dev\_project\_id](#output\_monitoring\_dev\_project\_id) | The project ID of the monitoring development project. |
| <a name="output_monitoring_nonprod_project_id"></a> [monitoring\_nonprod\_project\_id](#output\_monitoring\_nonprod\_project\_id) | The project ID of the monitoring non-production project. |
| <a name="output_monitoring_prod_project_id"></a> [monitoring\_prod\_project\_id](#output\_monitoring\_prod\_project\_id) | The project ID of the monitoring production project. |
| <a name="output_vpc_host_dev_project_id"></a> [vpc\_host\_dev\_project\_id](#output\_vpc\_host\_dev\_project\_id) | The project ID of the VPC host development project. |
| <a name="output_vpc_host_nonprod_project_id"></a> [vpc\_host\_nonprod\_project\_id](#output\_vpc\_host\_nonprod\_project\_id) | The project ID of the VPC host non-production project. |
| <a name="output_vpc_host_prod_project_id"></a> [vpc\_host\_prod\_project\_id](#output\_vpc\_host\_prod\_project\_id) | The project ID of the VPC host production project. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Please see [LICENSE](https://github.com/neutrino-io/terraform-google-foundation/blob/master/LICENSE) for how the code in
this repo is licensed.
