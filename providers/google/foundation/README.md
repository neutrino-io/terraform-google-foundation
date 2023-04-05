# Neutrino Platform Builder - GCP Foundation

This directory contains Terraform configuration for a foundational environment on Google Cloud.

## Prerequisites
- Ensure proper Terraform workspace is selected or created
- Login to GCP from CLI tool using `gcloud auth application-default login`

## Deploying

1. Run `terraform init`.
2. Run `terraform plan` and review the output.
3. Run `terraform apply`.

## Post Installation

- Manually enable Customer Identity https://console.cloud.google.com/marketplace/details/google-cloud-platform/customer-identity
- Manually configure the OAuth brands in GCP or using `foundation-post.sh` tool and extract the OAuth client ID and secret
- Need to manually add Firebase project. If GCP project didn't appear in Firebase add list, need to disable "Firebase Management API"

```shell
PROJECT_ID=foundry360-develop-g2-3bwor ACCOUNT_EMAIL=azri@pinc.my IAP_SUPPORT_EMAIL=gcp-devops@pinc.my ./foundation-post.s
```

## Solutions

### IAP Configuration

Manually configure the OAuth brands in GCP. Brands can only be created once for a Google Cloud project and the underlying Google API doesn't not support DELETE or PATCH methods.
Destroying a Terraform-managed Brand will remove it from state but will not delete it from Google Cloud.

Only internal org clients can be created via declarative tools. External clients must be manually created via the GCP console.
This restriction is due to the existing APIs and not lack of support in this tool.

Configure `Execution Mode` to `Local` for local development environment.

Next step need to deploy the `infra` and later `system` individually in sequence
