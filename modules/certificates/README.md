# certificates

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.8.0 |
| <a name="requirement_ansible"></a> [ansible](#requirement\_ansible) | >= 1, < 2 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2, < 3 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3, < 4 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3, < 4 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4, < 5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.2 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.6 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vault_ca_files"></a> [vault\_ca\_files](#module\_vault\_ca\_files) | git@github.com:deusjack/terraform-ansible-file.git | 1.0.0 |
| <a name="module_vault_cert_files"></a> [vault\_cert\_files](#module\_vault\_cert\_files) | git@github.com:deusjack/terraform-ansible-file.git | 1.0.0 |
| <a name="module_vault_key_files"></a> [vault\_key\_files](#module\_vault\_key\_files) | git@github.com:deusjack/terraform-ansible-file.git | 1.0.0 |
| <a name="module_vault_tls_dir"></a> [vault\_tls\_dir](#module\_vault\_tls\_dir) | git@github.com:deusjack/module-directory.git | 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [local_file.ca](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [tls_cert_request.vault_server](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request) | resource |
| [tls_locally_signed_cert.vault_server](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/locally_signed_cert) | resource |
| [tls_private_key.ca](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [tls_private_key.vault_server](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [tls_self_signed_cert.ca](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/self_signed_cert) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | The domain for your Hashicorp stack | `string` | n/a | yes |
| <a name="input_hashicorp_users"></a> [hashicorp\_users](#input\_hashicorp\_users) | Properties of the user used for defining access to Hashicorp files | <pre>object({<br>    triggers       = map(string)<br>    usernames      = map(string)<br>    primary_groups = map(string)<br>  })</pre> | n/a | yes |
| <a name="input_tls_dir"></a> [tls\_dir](#input\_tls\_dir) | Path of the TLS dir | `string` | n/a | yes |
| <a name="input_vault_nodes"></a> [vault\_nodes](#input\_vault\_nodes) | Set of node names to deploy Hashicorp Vault to | `set(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ca_cert_pem"></a> [ca\_cert\_pem](#output\_ca\_cert\_pem) | n/a |
| <a name="output_ca_path"></a> [ca\_path](#output\_ca\_path) | n/a |
| <a name="output_files"></a> [files](#output\_files) | n/a |
| <a name="output_root_ca"></a> [root\_ca](#output\_root\_ca) | n/a |
| <a name="output_triggers"></a> [triggers](#output\_triggers) | n/a |
<!-- END_TF_DOCS -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.8.0 |
| <a name="requirement_ansible"></a> [ansible](#requirement\_ansible) | >= 1, < 2 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2, < 3 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3, < 4 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3, < 4 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4, < 5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.1 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.5 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vault_ca_files"></a> [vault\_ca\_files](#module\_vault\_ca\_files) | git@github.com:deusjack/module-file.git | 1.0.0 |
| <a name="module_vault_cert_files"></a> [vault\_cert\_files](#module\_vault\_cert\_files) | git@github.com:deusjack/module-file.git | 1.0.0 |
| <a name="module_vault_key_files"></a> [vault\_key\_files](#module\_vault\_key\_files) | git@github.com:deusjack/module-file.git | 1.0.0 |
| <a name="module_vault_tls_dir"></a> [vault\_tls\_dir](#module\_vault\_tls\_dir) | git@github.com:deusjack/module-directory.git | 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [local_file.ca](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [tls_cert_request.vault_server](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request) | resource |
| [tls_locally_signed_cert.vault_server](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/locally_signed_cert) | resource |
| [tls_private_key.ca](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [tls_private_key.vault_server](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [tls_self_signed_cert.ca](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/self_signed_cert) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | The domain for your Hashicorp stack | `string` | n/a | yes |
| <a name="input_hashicorp_users"></a> [hashicorp\_users](#input\_hashicorp\_users) | Properties of the user used for defining access to Hashicorp files | <pre>object({<br>    triggers       = map(string)<br>    usernames      = map(string)<br>    primary_groups = map(string)<br>  })</pre> | n/a | yes |
| <a name="input_tls_dir"></a> [tls\_dir](#input\_tls\_dir) | Path of the TLS dir | `string` | n/a | yes |
| <a name="input_vault_nodes"></a> [vault\_nodes](#input\_vault\_nodes) | Set of node names to deploy Hashicorp Vault to | `set(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ca_cert_pem"></a> [ca\_cert\_pem](#output\_ca\_cert\_pem) | n/a |
| <a name="output_ca_path"></a> [ca\_path](#output\_ca\_path) | n/a |
| <a name="output_files"></a> [files](#output\_files) | n/a |
| <a name="output_root_ca"></a> [root\_ca](#output\_root\_ca) | n/a |
| <a name="output_triggers"></a> [triggers](#output\_triggers) | n/a |
<!-- END_TF_DOCS -->
