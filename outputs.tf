output "triggers" {
  value = {
    vault = join(" ", [for k, v in module.vault : v.triggers.playbook])
  }
}

output "directories" {
  value = module.config.directories
}

output "container_name" {
  value = { for k, v in module.vault : k => v.name }
}

output "cert_files_path" {
  value = module.certificates.files
}

output "root_ca" {
  value = module.certificates.root_ca
}
