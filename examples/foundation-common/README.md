# Foundation Common Example

Example of how to use the Foundation Common module to deploy a common folder and project structure including shared
network infrastructure.

## Pre Requisite

- Complete setup of Google Cloud Identity and organization

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

No providers.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account to associate this project with | `string` | n/a | yes |
| <a name="input_iam_billing_principal"></a> [iam\_billing\_principal](#input\_iam\_billing\_principal) | The principal to grant the billing role to | `string` | n/a | yes |
| <a name="input_iam_organization_principal"></a> [iam\_organization\_principal](#input\_iam\_organization\_principal) | The principal to grant the organization role to | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The ID of the organization to create the project in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_org_id"></a> [org\_id](#output\_org\_id) | Outputs |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Please see [LICENSE](https://github.com/neutrino-io/terraform-google-foundation/blob/master/LICENSE) for how the code in
this repo is licensed.
