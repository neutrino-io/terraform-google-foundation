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
| <a name="output_folder-development"></a> [folder-development](#output\_folder-development) | Outputs |
| <a name="output_folder-non-production"></a> [folder-non-production](#output\_folder-non-production) | n/a |
| <a name="output_folder-production"></a> [folder-production](#output\_folder-production) | n/a |
| <a name="output_iam-development"></a> [iam-development](#output\_iam-development) | Outputs for iam |
| <a name="output_iam-non-production"></a> [iam-non-production](#output\_iam-non-production) | n/a |
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