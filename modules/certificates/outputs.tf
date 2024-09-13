output "triggers" {
  value = {
    ca_file           = join(" ", [for k, v in module.vault_ca_files : v.triggers.playbook])
    server_key_files  = join(" ", [for k, v in module.vault_key_files : v.triggers.playbook])
    server_cert_files = join(" ", [for k, v in module.vault_cert_files : v.triggers.playbook])
  }
}

output "files" {
  value = {
    ca    = { for k, v in module.vault_ca_files : k => v.path }
    keys  = { for k, v in module.vault_key_files : k => v.path }
    certs = { for k, v in module.vault_cert_files : k => v.path }
  }
}

output "root_ca" {
  value = {
    key  = tls_private_key.ca.private_key_pem
    cert = tls_self_signed_cert.ca.cert_pem
  }
  sensitive = true
}

output "ca_cert_pem" {
  value = tls_self_signed_cert.ca.cert_pem
}

output "ca_path" {
  value = local_file.ca.filename
}
