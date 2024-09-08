###########
# Root CA #
###########

resource "tls_private_key" "ca" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P256"
}

resource "tls_self_signed_cert" "ca" {
  allowed_uses = [
    "cert_signing",
    "crl_signing"
  ]
  private_key_pem       = tls_private_key.ca.private_key_pem
  is_ca_certificate     = true
  validity_period_hours = 24 * 365 * 10
  early_renewal_hours   = (24 * 365 * 10) * 2 / 3
  subject {
    common_name = "Hashicorp Root CA"
  }
}

resource "local_file" "ca" {
  filename             = "${path.root}/.terraform/tmp/root-ca.pem"
  content              = tls_self_signed_cert.ca.cert_pem
  directory_permission = "0755"
  file_permission      = "0644"
}

###############
# server cert #
###############

resource "tls_private_key" "vault_server" {
  for_each    = toset(var.vault_nodes)
  algorithm   = "ECDSA"
  ecdsa_curve = "P256"
}

resource "tls_cert_request" "vault_server" {
  for_each        = toset(var.vault_nodes)
  private_key_pem = tls_private_key.vault_server[each.key].private_key_pem
  dns_names = [
    "vault.${var.domain}",
    "${each.value}.vault.${var.domain}",
  ]
  ip_addresses = ["127.0.0.1"]
  subject {
    common_name = "vault.${var.domain}"
  }
}

resource "tls_locally_signed_cert" "vault_server" {
  for_each = toset(var.vault_nodes)
  allowed_uses = [
    "client_auth",
    "server_auth"
  ]
  ca_cert_pem           = tls_self_signed_cert.ca.cert_pem
  ca_private_key_pem    = tls_private_key.ca.private_key_pem
  cert_request_pem      = tls_cert_request.vault_server[each.key].cert_request_pem
  validity_period_hours = 24 * 365
  early_renewal_hours   = (24 * 365) * 2 / 3
}

#########################
# Adding certs to nodes #
#########################

module "vault_tls_dir" {
  for_each    = var.vault_nodes
  source      = "git@github.com:deusjack/module-directory.git?ref=1.0.0"
  hostname    = each.value
  path        = var.tls_dir
  mode        = "0755"
  owner       = "root"
  group_owner = var.hashicorp_users.primary_groups[each.value]
  secontext = {
    type = "container_file_t"
  }
}

module "vault_ca_files" {
  depends_on  = [module.vault_tls_dir]
  for_each    = var.vault_nodes
  source      = "git@github.com:deusjack/module-file.git?ref=1.0.0"
  hostname    = each.value
  content     = tls_self_signed_cert.ca.cert_pem
  path        = "${module.vault_tls_dir[each.key].path}/vault-ca.pem"
  mode        = "0640"
  owner       = "root"
  group_owner = var.hashicorp_users.primary_groups[each.value]
  secontext = {
    type = "container_file_t"
  }
}

module "vault_cert_files" {
  depends_on  = [module.vault_tls_dir]
  for_each    = var.vault_nodes
  source      = "git@github.com:deusjack/module-file.git?ref=1.0.0"
  hostname    = each.value
  content     = tls_locally_signed_cert.vault_server[each.key].cert_pem
  path        = "${module.vault_tls_dir[each.key].path}/vault-cert.pem"
  mode        = "0640"
  owner       = "root"
  group_owner = var.hashicorp_users.primary_groups[each.value]
  secontext = {
    type = "container_file_t"
  }
}

module "vault_key_files" {
  depends_on  = [module.vault_tls_dir]
  for_each    = var.vault_nodes
  source      = "git@github.com:deusjack/module-file.git?ref=1.0.0"
  hostname    = each.value
  content     = tls_private_key.vault_server[each.key].private_key_pem
  path        = "${module.vault_tls_dir[each.key].path}/vault-key.pem"
  mode        = "0640"
  owner       = "root"
  group_owner = var.hashicorp_users.primary_groups[each.value]
  secontext = {
    type = "container_file_t"
  }
}
