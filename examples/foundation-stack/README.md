# Foundation Stack Example

Example of how to use the Foundation Stack module to deploy a standardize application stack on GCP. After deployment, 
the following key resources will be created:

- Set of folders for the application stack
- 3 projects for the application stack within related folders
- 1 service account for the application stack

## Pre Requisite

- Complete setup of Google Cloud Identity and organization
- Complete the deployment of Foundation Common

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_org_id"></a> [app\_org\_id](#input\_app\_org\_id) | The application organization ID | `string` | n/a | yes |
| <a name="input_app_org_label"></a> [app\_org\_label](#input\_app\_org\_label) | The application organization label | `string` | n/a | yes |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account to associate this project with | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The organization ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_foundation-stack-project-develop"></a> [foundation-stack-project-develop](#output\_foundation-stack-project-develop) | Foundation outputs |
| <a name="output_foundation-stack-project-production"></a> [foundation-stack-project-production](#output\_foundation-stack-project-production) | n/a |
| <a name="output_foundation-stack-project-staging"></a> [foundation-stack-project-staging](#output\_foundation-stack-project-staging) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Please see [LICENSE](https://github.com/neutrino-io/terraform-google-foundation/blob/master/LICENSE) for how the code in
this repo is licensed.