output "triggers" {
  value = {
    vault = join(" ", [for k, v in module.vault : v.triggers.playbook])
  }
}

output "directories" {
  value = module.config.directories
}

output "container_name" {
  value = module.vault.name
}
