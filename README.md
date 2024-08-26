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

<!-- BEGIN_TF_DOCS -->
Copyright 2021 Google LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

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
| <a name="input_cleanup_policies"></a> [cleanup\_policies](#input\_cleanup\_policies) | Object containing details about the cleanup policies for an Artifact Registry repository. | <pre>map(object({<br>    action = string<br>    condition = optional(object({<br>      tag_state             = optional(string)<br>      tag_prefixes          = optional(list(string))<br>      older_than            = optional(string)<br>      newer_than            = optional(string)<br>      package_name_prefixes = optional(list(string))<br>      version_name_prefixes = optional(list(string))<br>    }))<br>    most_recent_versions = optional(object({<br>      package_name_prefixes = optional(list(string))<br>      keep_count            = optional(number)<br>    }))<br>  }))</pre> | `null` | no |
| <a name="input_cleanup_policy_dry_run"></a> [cleanup\_policy\_dry\_run](#input\_cleanup\_policy\_dry\_run) | If true, the cleanup pipeline is prevented from deleting versions in this repository. | `bool` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | An optional description for the repository | `string` | `"Terraform-managed registry"` | no |
| <a name="input_encryption_key"></a> [encryption\_key](#input\_encryption\_key) | The KMS key name to use for encryption at rest. | `string` | `null` | no |
| <a name="input_format"></a> [format](#input\_format) | Repository format. One of DOCKER or UNSPECIFIED | `string` | `"DOCKER"` | no |
| <a name="input_iam"></a> [iam](#input\_iam) | IAM bindings in {ROLE => [MEMBERS]} format. | `map(list(string))` | `{}` | no |
| <a name="input_iam_additive"></a> [iam\_additive](#input\_iam\_additive) | IAM additive bindings in {ROLE => [MEMBERS]} format. | `map(list(string))` | `{}` | no |
| <a name="input_id"></a> [id](#input\_id) | Repository id | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to be attached to the registry. | `map(string)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | Registry location. Use `gcloud beta artifacts locations list' to get valid values` | `string` | `""` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | Repository mode. One of STANDARD\_REPOSITORY, VIRTUAL\_REPOSITORY, or REMOTE\_REPOSITORY | `string` | `"STANDARD_REPOSITORY"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Registry project id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Repository id |
| <a name="output_name"></a> [name](#output\_name) | Repository name |
<!-- END_TF_DOCS -->