# Foundation Stack Example

Example of how to use the Foundation Stack module to deploy a standardize application stack on GCP. After deployment, 
the following key resources will be created:
- Set of folders for the application stack
- 3 projects for the application stack within related folders
- 1 service account for the application stack

## Pre Requisite
- Complete setup of Google Cloud Identity and organization
- Complete the deployment of Foundation Common

## Solutions

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

## License

Please see [LICENSE](https://github.com/neutrino-io/terraform-google-foundation/blob/master/LICENSE) for how the code in
this repo is licensed.