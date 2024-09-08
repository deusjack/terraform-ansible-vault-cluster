# vault_init

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.8.0 |
| <a name="requirement_ansible"></a> [ansible](#requirement\_ansible) | >= 1, < 2 |
| <a name="requirement_dns"></a> [dns](#requirement\_dns) | >= 3, < 4 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2, < 3 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3, < 4 |
| <a name="requirement_onepassword"></a> [onepassword](#requirement\_onepassword) | >= 2, < 3 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3, < 4 |
| <a name="requirement_time"></a> [time](#requirement\_time) | >= 0.12.0, < 1 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4, < 5 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >= 4, < 5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ansible"></a> [ansible](#provider\_ansible) | 1.3.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.1 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.2 |
| <a name="provider_onepassword"></a> [onepassword](#provider\_onepassword) | 2.1.2 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.2 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.12.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ansible_playbook.unseal_script_file](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [ansible_playbook.vault_init](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [ansible_playbook.vault_join](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [ansible_playbook.vault_systemd_daemon_reload](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [ansible_playbook.vault_systemd_timer](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [ansible_playbook.vault_unseal](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [ansible_playbook.vault_unseal_systemd_file](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [ansible_playbook.vault_unseal_timer_file](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [local_file.vault_unseal_script](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [null_resource.file_copy](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.run_command](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.systemd](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.vault](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.vault_systemd_file](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.vault_unseal](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [onepassword_item.vault](https://registry.terraform.io/providers/1Password/onepassword/latest/docs/resources/item) | resource |
| [random_password.onepassword_vault_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [time_sleep.vault_unseal](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ansible_bug_string"></a> [ansible\_bug\_string](#input\_ansible\_bug\_string) | The error string, that is wrongly put into ansible stdout | `string` | n/a | yes |
| <a name="input_directories"></a> [directories](#input\_directories) | Path for data, config and tls directories | <pre>object({<br>    data   = string<br>    config = string<br>    tls    = string<br>  })</pre> | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | The domain for your Hashicorp stack | `string` | n/a | yes |
| <a name="input_files"></a> [files](#input\_files) | n/a | <pre>object({<br>    ca    = map(string)<br>    keys  = map(string)<br>    certs = map(string)<br>  })</pre> | n/a | yes |
| <a name="input_nodes"></a> [nodes](#input\_nodes) | Map of groups with node names | `map(set(string))` | n/a | yes |
| <a name="input_onepassword"></a> [onepassword](#input\_onepassword) | Settings for 1password | <pre>object({<br>    hashicorp_vault_uuid = string<br>    environment_path     = string<br>  })</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Default tags for all taggable resources | `list(string)` | n/a | yes |
| <a name="input_triggers_vault"></a> [triggers\_vault](#input\_triggers\_vault) | Triggers for vault changes | `map(string)` | n/a | yes |
| <a name="input_vault_nodes"></a> [vault\_nodes](#input\_vault\_nodes) | Set of node names to deploy Hashicorp Vault to | `set(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_root_token"></a> [root\_token](#output\_root\_token) | n/a |
<!-- END_TF_DOCS -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.8.0 |
| <a name="requirement_ansible"></a> [ansible](#requirement\_ansible) | >= 1, < 2 |
| <a name="requirement_dns"></a> [dns](#requirement\_dns) | >= 3, < 4 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2, < 3 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3, < 4 |
| <a name="requirement_onepassword"></a> [onepassword](#requirement\_onepassword) | >= 2, < 3 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3, < 4 |
| <a name="requirement_time"></a> [time](#requirement\_time) | >= 0.12.0, < 1 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4, < 5 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >= 4, < 5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ansible"></a> [ansible](#provider\_ansible) | >= 1, < 2 |
| <a name="provider_local"></a> [local](#provider\_local) | >= 2, < 3 |
| <a name="provider_null"></a> [null](#provider\_null) | >= 3, < 4 |
| <a name="provider_onepassword"></a> [onepassword](#provider\_onepassword) | >= 2, < 3 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3, < 4 |
| <a name="provider_time"></a> [time](#provider\_time) | >= 0.12.0, < 1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ansible_playbook.unseal_script_file](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [ansible_playbook.vault_init](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [ansible_playbook.vault_join](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [ansible_playbook.vault_systemd_daemon_reload](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [ansible_playbook.vault_systemd_timer](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [ansible_playbook.vault_unseal](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [ansible_playbook.vault_unseal_systemd_file](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [ansible_playbook.vault_unseal_timer_file](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [local_file.vault_unseal_script](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [null_resource.file_copy](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.run_command](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.systemd](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.vault](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.vault_systemd_file](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.vault_unseal](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [onepassword_item.vault](https://registry.terraform.io/providers/1Password/onepassword/latest/docs/resources/item) | resource |
| [random_password.onepassword_vault_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [time_sleep.vault_unseal](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ansible_bug_string"></a> [ansible\_bug\_string](#input\_ansible\_bug\_string) | The error string, that is wrongly put into ansible stdout | `string` | n/a | yes |
| <a name="input_directories"></a> [directories](#input\_directories) | Path for data, config and tls directories | <pre>object({<br>    data   = string<br>    config = string<br>    tls    = string<br>  })</pre> | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | The domain for your Hashicorp stack | `string` | n/a | yes |
| <a name="input_files"></a> [files](#input\_files) | n/a | <pre>object({<br>    ca    = map(string)<br>    keys  = map(string)<br>    certs = map(string)<br>  })</pre> | n/a | yes |
| <a name="input_nodes"></a> [nodes](#input\_nodes) | Map of groups with node names | `map(set(string))` | n/a | yes |
| <a name="input_onepassword"></a> [onepassword](#input\_onepassword) | Settings for 1password | <pre>object({<br>    hashicorp_vault_uuid = string<br>    environment_path     = string<br>  })</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Default tags for all taggable resources | `list(string)` | n/a | yes |
| <a name="input_triggers_vault"></a> [triggers\_vault](#input\_triggers\_vault) | Triggers for vault changes | `map(string)` | n/a | yes |
| <a name="input_vault_nodes"></a> [vault\_nodes](#input\_vault\_nodes) | Set of node names to deploy Hashicorp Vault to | `set(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_root_token"></a> [root\_token](#output\_root\_token) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
