[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/neutrino-io/terraform-google-foundation.svg?label=latest)](https://github.com/neutrino-io/terraform-google-foundation/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D1.0.x-blue.svg)

# Neutrino Platform Builder - GCP Foundation Common Network

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.61.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vpc_host_dev_project_id"></a> [vpc\_host\_dev\_project\_id](#input\_vpc\_host\_dev\_project\_id) | The project ID where the VPC and subnets will be created. | `string` | n/a | yes |
| <a name="input_vpc_host_nonprod_project_id"></a> [vpc\_host\_nonprod\_project\_id](#input\_vpc\_host\_nonprod\_project\_id) | The project ID where the VPC and subnets will be created. | `string` | n/a | yes |
| <a name="input_vpc_host_prod_project_id"></a> [vpc\_host\_prod\_project\_id](#input\_vpc\_host\_prod\_project\_id) | The project ID where the VPC and subnets will be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_development_vpc"></a> [development\_vpc](#output\_development\_vpc) | Development VPC information |
| <a name="output_nonprod_vpc"></a> [nonprod\_vpc](#output\_nonprod\_vpc) | Non-Prod VPC information |
| <a name="output_production_vpc"></a> [production\_vpc](#output\_production\_vpc) | Production VPC information |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Please see [LICENSE](https://github.com/neutrino-io/terraform-google-foundation/blob/master/LICENSE) for how the code in
this repo is licensed.