# terraform-ansible-vault-cluster
Terraform module to create a Vault cluster on bare metal with Ansible

> [!Warning]
> * This module doesn't have resources with a traditional state.
> * Make sure to set var.external_triggers for any changes that require an update other than variables.
> * This module doesn't delete the changes on the target system on destroy.
> * Set the image version to be exact or minor, because auto update is enabled.

# Terraform Docs

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.8.0 |
| <a name="requirement_ansible"></a> [ansible](#requirement\_ansible) | >= 1, < 2 |
| <a name="requirement_dns"></a> [dns](#requirement\_dns) | >= 3, < 4 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2, < 3 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3, < 4 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3, < 4 |
| <a name="requirement_time"></a> [time](#requirement\_time) | >= 0.12.0, < 1 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4, < 5 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_certificates"></a> [certificates](#module\_certificates) | ./modules/certificates | n/a |
| <a name="module_config"></a> [config](#module\_config) | ./modules/config | n/a |
| <a name="module_vault"></a> [vault](#module\_vault) | git@github.com:deusjack/terraform-ansible-podman-container.git | 1.0.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | The domain for your Hashicorp stack | `string` | n/a | yes |
| <a name="input_hashicorp_users"></a> [hashicorp\_users](#input\_hashicorp\_users) | Properties of the user used for defining access to Hashicorp files | <pre>object({<br>    triggers       = map(string)<br>    usernames      = map(string)<br>    primary_groups = map(string)<br>    uids           = map(string)<br>    primary_gids   = map(string)<br>  })</pre> | n/a | yes |
| <a name="input_vault_nodes"></a> [vault\_nodes](#input\_vault\_nodes) | Set of node names to deploy Hashicorp Vault to | `set(string)` | n/a | yes |
| <a name="input_vault_version"></a> [vault\_version](#input\_vault\_version) | Version of the Vault's image | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cert_files_path"></a> [cert\_files\_path](#output\_cert\_files\_path) | n/a |
| <a name="output_container_name"></a> [container\_name](#output\_container\_name) | n/a |
| <a name="output_directories"></a> [directories](#output\_directories) | n/a |
| <a name="output_root_ca"></a> [root\_ca](#output\_root\_ca) | n/a |
| <a name="output_triggers"></a> [triggers](#output\_triggers) | n/a |
<!-- END_TF_DOCS -->
