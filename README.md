# Google Cloud Artifact Registry Module

This module simplifies the creation of repositories using Google Cloud Artifact Registry.

Note: Artifact Registry is still in beta, hence this module currently uses the beta provider.

## Example

```hcl
module "docker_artifact_registry" {
  source     = "github.com/dapperlabs-platform/terraform-google-artifact-registry?ref=tag"
  project_id = "myproject"
  location   = "europe-west1"
  format     = "DOCKER"
  id         = "myregistry"
  iam = {
    "roles/artifactregistry.admin" = ["group:cicd@example.com"]
  }
}
# tftest:modules=1:resources=2
```

<!-- BEGIN TFDOC -->

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_artifact_registry_repository.registry](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_artifact_registry_repository) | resource |
| [google-beta_google_artifact_registry_repository_iam_binding.bindings](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_artifact_registry_repository_iam_binding) | resource |
| [google-beta_google_artifact_registry_repository_iam_member.bindings_member](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_artifact_registry_repository_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | An optional description for the repository | `string` | `"Terraform-managed registry"` | no |
| <a name="input_format"></a> [format](#input\_format) | Repository format. One of DOCKER or UNSPECIFIED | `string` | `"DOCKER"` | no |
| <a name="input_iam"></a> [iam](#input\_iam) | IAM bindings in {ROLE => [MEMBERS]} format. | `map(list(string))` | `{}` | no |
| <a name="input_iam_additive"></a> [iam\_additive](#input\_iam\_additive) | IAM additive bindings in {ROLE => [MEMBERS]} format. | `map(list(string))` | `{}` | no |
| <a name="input_id"></a> [id](#input\_id) | Repository id | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to be attached to the registry. | `map(string)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | Registry location. Use `gcloud beta artifacts locations list' to get valid values` | `string` | `""` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Registry project id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Repository id |
| <a name="output_name"></a> [name](#output\_name) | Repository name |

<!-- END TFDOC -->
