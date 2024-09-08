# config

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.8.0 |
| <a name="requirement_ansible"></a> [ansible](#requirement\_ansible) | >= 1.0, < 2 |
| <a name="requirement_dns"></a> [dns](#requirement\_dns) | >= 3.0, < 4 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3.0, < 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ansible"></a> [ansible](#provider\_ansible) | 1.3.0 |
| <a name="provider_dns"></a> [dns](#provider\_dns) | 3.4.1 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ansible_playbook.vault_config](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [ansible_playbook.vault_data](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [dns_a_record_set.vault_cluster](https://registry.terraform.io/providers/hashicorp/dns/latest/docs/resources/a_record_set) | resource |
| [dns_aaaa_record_set.vault_cluster](https://registry.terraform.io/providers/hashicorp/dns/latest/docs/resources/aaaa_record_set) | resource |
| [dns_cname_record.vault_nodes](https://registry.terraform.io/providers/hashicorp/dns/latest/docs/resources/cname_record) | resource |
| [null_resource.directory](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.file_write](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.hashicorp](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.vault_config](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.vault_data_dir](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [dns_a_record_set.vault_nodes](https://registry.terraform.io/providers/hashicorp/dns/latest/docs/data-sources/a_record_set) | data source |
| [dns_aaaa_record_set.vault_nodes](https://registry.terraform.io/providers/hashicorp/dns/latest/docs/data-sources/aaaa_record_set) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | The domain for your Hashicorp stack | `string` | n/a | yes |
| <a name="input_hashicorp_users"></a> [hashicorp\_users](#input\_hashicorp\_users) | Properties of the user used for defining access to Hashicorp files | <pre>object({<br>    triggers       = map(string)<br>    usernames      = map(string)<br>    primary_groups = map(string)<br>  })</pre> | n/a | yes |
| <a name="input_vault_nodes"></a> [vault\_nodes](#input\_vault\_nodes) | Set of node names to deploy Hashicorp Vault to | `set(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_directories"></a> [directories](#output\_directories) | n/a |
| <a name="output_triggers"></a> [triggers](#output\_triggers) | n/a |
<!-- END_TF_DOCS -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.8.0 |
| <a name="requirement_ansible"></a> [ansible](#requirement\_ansible) | >= 1.0, < 2 |
| <a name="requirement_dns"></a> [dns](#requirement\_dns) | >= 3.0, < 4 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3.0, < 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_dns"></a> [dns](#provider\_dns) | 3.4.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vault_config"></a> [vault\_config](#module\_vault\_config) | git@github.com:deusjack/module-file.git | 1.0.0 |
| <a name="module_vault_config_dir"></a> [vault\_config\_dir](#module\_vault\_config\_dir) | git@github.com:deusjack/module-directory.git | 1.0.0 |
| <a name="module_vault_data_dir"></a> [vault\_data\_dir](#module\_vault\_data\_dir) | git@github.com:deusjack/module-directory.git | 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [dns_a_record_set.vault_cluster](https://registry.terraform.io/providers/hashicorp/dns/latest/docs/resources/a_record_set) | resource |
| [dns_aaaa_record_set.vault_cluster](https://registry.terraform.io/providers/hashicorp/dns/latest/docs/resources/aaaa_record_set) | resource |
| [dns_cname_record.vault_nodes](https://registry.terraform.io/providers/hashicorp/dns/latest/docs/resources/cname_record) | resource |
| [dns_a_record_set.vault_nodes](https://registry.terraform.io/providers/hashicorp/dns/latest/docs/data-sources/a_record_set) | data source |
| [dns_aaaa_record_set.vault_nodes](https://registry.terraform.io/providers/hashicorp/dns/latest/docs/data-sources/aaaa_record_set) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | The domain for your Hashicorp stack | `string` | n/a | yes |
| <a name="input_hashicorp_users"></a> [hashicorp\_users](#input\_hashicorp\_users) | Properties of the user used for defining access to Hashicorp files | <pre>object({<br>    triggers       = map(string)<br>    usernames      = map(string)<br>    primary_groups = map(string)<br>  })</pre> | n/a | yes |
| <a name="input_vault_nodes"></a> [vault\_nodes](#input\_vault\_nodes) | Set of node names to deploy Hashicorp Vault to | `set(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_directories"></a> [directories](#output\_directories) | n/a |
| <a name="output_triggers"></a> [triggers](#output\_triggers) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
