output "triggers" {
  value = {
    ansible_data_dir   = join(" ", [for k, v in module.vault_data_dir : v.triggers.playbook])
    ansible_config_dir = join(" ", [for k, v in module.vault_config_dir : v.triggers.playbook])
    ansible_config     = join(" ", [for k, v in module.vault_config : v.triggers.playbook])
  }
}

output "directories" {
  value = {
    data   = local.vault_data_dir
    config = local.vault_config_dir
    tls    = local.vault_tls_dir
  }
}
