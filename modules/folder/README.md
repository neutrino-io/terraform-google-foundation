[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/neutrino-io/terraform-google-foundation.svg?label=latest)](https://github.com/neutrino-io/terraform-google-foundation/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D1.0.x-blue.svg)

# Neutrino Platform Builder - GCP Foundation Folder

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.61.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_org_label"></a> [app\_org\_label](#input\_app\_org\_label) | The application organization label for the associated resources | `string` | n/a | yes |
| <a name="input_iam_developer_principle"></a> [iam\_developer\_principle](#input\_iam\_developer\_principle) | The IAM developer principle for the associated resources | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The organization id for the associated resources | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_folder-development"></a> [folder-development](#output\_folder-development) | The Development folder resource. |
| <a name="output_folder-non-production"></a> [folder-non-production](#output\_folder-non-production) | The Non-Production folder resource. |
| <a name="output_folder-organizations"></a> [folder-organizations](#output\_folder-organizations) | The Organisation folder resource. |
| <a name="output_folder-production"></a> [folder-production](#output\_folder-production) | The Production folder resource. |
| <a name="output_iam-development"></a> [iam-development](#output\_iam-development) | Outputs for iam |
| <a name="output_iam-non-production"></a> [iam-non-production](#output\_iam-non-production) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Please see [LICENSE](https://github.com/neutrino-io/terraform-google-foundation/blob/master/LICENSE) for how the code in
this repo is licensed.
