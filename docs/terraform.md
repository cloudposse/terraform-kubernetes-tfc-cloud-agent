<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |
| kubernetes | >= 1.12.0 |

## Providers

| Name | Version |
|------|---------|
| kubernetes | >= 1.12.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| this | git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.24.1 |  |

## Resources

| Name |
|------|
| [kubernetes_deployment](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) |
| [kubernetes_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) |
| [kubernetes_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) |
| [kubernetes_service_account](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_tag\_map | Additional tags for appending to tags\_as\_list\_of\_maps. Not added to `tags`. | `map(string)` | `{}` | no |
| agent\_cli\_args | Extra command line arguments to pass to tfc-agent | `list(any)` | `[]` | no |
| agent\_envs | A map of any extra environment variables to pass to the TFC agent | `map(any)` | `{}` | no |
| agent\_image | Name and tag of Terraform Cloud Agent docker image | `string` | `"hashicorp/tfc-agent:latest"` | no |
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| context | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | <pre>object({<br>    enabled             = bool<br>    namespace           = string<br>    environment         = string<br>    stage               = string<br>    name                = string<br>    delimiter           = string<br>    attributes          = list(string)<br>    tags                = map(string)<br>    additional_tag_map  = map(string)<br>    regex_replace_chars = string<br>    label_order         = list(string)<br>    id_length_limit     = number<br>  })</pre> | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_order": [],<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {}<br>}</pre> | no |
| delimiter | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| deployment\_annotations | Annotations to add to the Kubernetes deployment | `map(any)` | `{}` | no |
| deployment\_name | Override the deployment name in Kubernetes | `string` | `null` | no |
| enabled | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| environment | Environment, e.g. 'uw2', 'us-west-2', OR 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| id\_length\_limit | Limit `id` to this many characters.<br>Set to `0` for unlimited length.<br>Set to `null` for default, which is `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| kubernetes\_namespace | Kubernetes namespace override | `string` | `null` | no |
| label\_order | The naming order of the id output and Name tag.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 5 elements, but at least one must be present. | `list(string)` | `null` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | `string` | `null` | no |
| namespace | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `null` | no |
| namespace\_creation\_enabled | Enable this if the Kubernetes namespace does not already exist | `bool` | `false` | no |
| regex\_replace\_chars | Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| replicas | Number of replicas in the Kubernetes deployment | `number` | `1` | no |
| resource\_limits\_cpu | Kubernetes deployment resource hard CPU limit | `string` | `"1"` | no |
| resource\_limits\_memory | Kubernetes deployment resource hard memory limit | `string` | `"512Mi"` | no |
| resource\_requests\_cpu | Kubernetes deployment resource CPU requests | `string` | `"250m"` | no |
| resource\_requests\_memory | Kubernetes deployment resource memory requests | `string` | `"50Mi"` | no |
| service\_account\_annotations | Annotations to add to the Kubernetes service account | `map(any)` | `{}` | no |
| stage | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |
| tfc\_address | The HTTP or HTTPS address of the Terraform Cloud API. | `string` | `"https://app.terraform.io"` | no |
| tfc\_agent\_data\_dir | The path to a directory to store all agent-related data, including<br>Terraform configurations, cached Terraform release archives, etc. It is<br>important to ensure that the given directory is backed by plentiful<br>storage. | `string` | `null` | no |
| tfc\_agent\_disable\_update | Disable automatic core updates. | `bool` | `false` | no |
| tfc\_agent\_log\_level | The log verbosity expressed as a level string. Level options include<br>"trace", "debug", "info", "warn", and "error" | `string` | `"info"` | no |
| tfc\_agent\_single | Enable single mode. This causes the agent to handle at most one job and<br>immediately exit thereafter. Useful for running agents as ephemeral<br>containers, VMs, or other isolated contexts with a higher-level scheduler<br>or process supervisor. | `bool` | `false` | no |
| tfc\_agent\_token | The agent token to use when making requests to the Terraform Cloud API.<br>This token must be obtained from the API or UI.  It is recommended to use<br>the environment variable whenever possible for configuring this setting due<br>to the sensitive nature of API tokens. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| namespace | Name of the Kubernetes namespace |
| service\_account\_name | Name of the Kubernetes service account |
<!-- markdownlint-restore -->
