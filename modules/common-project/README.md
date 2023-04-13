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
| <a name="output_logging_project_id"></a> [logging\_project\_id](#output\_logging\_project\_id) | Outputs |
| <a name="output_monitoring_dev_project_id"></a> [monitoring\_dev\_project\_id](#output\_monitoring\_dev\_project\_id) | n/a |
| <a name="output_monitoring_nonprod_project_id"></a> [monitoring\_nonprod\_project\_id](#output\_monitoring\_nonprod\_project\_id) | n/a |
| <a name="output_monitoring_prod_project_id"></a> [monitoring\_prod\_project\_id](#output\_monitoring\_prod\_project\_id) | n/a |
| <a name="output_vpc_host_dev_project_id"></a> [vpc\_host\_dev\_project\_id](#output\_vpc\_host\_dev\_project\_id) | n/a |
| <a name="output_vpc_host_nonprod_project_id"></a> [vpc\_host\_nonprod\_project\_id](#output\_vpc\_host\_nonprod\_project\_id) | n/a |
| <a name="output_vpc_host_prod_project_id"></a> [vpc\_host\_prod\_project\_id](#output\_vpc\_host\_prod\_project\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

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