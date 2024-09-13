locals {
  vault_config_dir = "/etc/vault.d"
  vault_data_dir   = "/opt/vault/data"
  vault_tls_dir    = "/opt/vault/tls"
}

############
# data dir #
############

module "vault_data_dir" {
  for_each = var.vault_nodes
  source   = "git@github.com:deusjack/module-directory.git?ref=1.0.0"
  hostname = each.value
  path     = local.vault_data_dir
  owner    = var.hashicorp_users.primary_groups[each.value]
  mode     = "0770"
  secontext = {
    type = "container_file_t"
  }
}

##########
# config #
##########

module "vault_config_dir" {
  for_each    = var.vault_nodes
  source      = "git@github.com:deusjack/module-directory.git?ref=1.0.0"
  hostname    = each.value
  path        = local.vault_config_dir
  owner       = "root"
  group_owner = var.hashicorp_users.primary_groups[each.value]
  mode        = "0750"
  secontext = {
    type = "container_file_t"
  }
}

module "vault_config" {
  depends_on = [module.vault_config_dir]
  for_each   = var.vault_nodes
  source     = "git@github.com:deusjack/module-file.git?ref=1.0.0"
  hostname   = each.value
  content = templatefile("${path.module}/vault.hcl.tftpl", {
    CLUSTER_ADDRESS = "${each.value}.${dns_a_record_set.vault_cluster.name}.${var.domain}"
    API_ADDRESS     = "${dns_a_record_set.vault_cluster.name}.${var.domain}"
    TLS_PATH        = local.vault_tls_dir
    STORAGE_PATH    = local.vault_data_dir
    NODE_ID         = each.value
  })
  path        = "${local.vault_config_dir}/vault.hcl"
  mode        = "0640"
  owner       = "root"
  group_owner = var.hashicorp_users.primary_groups[each.value]
  secontext = {
    type = "container_file_t"
  }
}
