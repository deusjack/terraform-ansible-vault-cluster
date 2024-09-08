module "config" {
  source          = "./modules/config"
  domain          = var.domain
  hashicorp_users = var.hashicorp_users
  vault_nodes     = var.vault_nodes
}

module "certificates" {
  depends_on      = [module.config]
  source          = "./modules/certificates"
  domain          = var.domain
  hashicorp_users = var.hashicorp_users
  vault_nodes     = var.vault_nodes
  tls_dir         = module.config.directories.tls
}

module "vault" {
  depends_on = [module.certificates]
  for_each   = var.vault_nodes
  source     = "git@github.com:deusjack/module-podman-container.git"
  hostname   = each.value
  name       = "vault"
  image      = "docker.io/hashicorp/vault:${var.vault_version}"
  command    = "server -config=${module.config.directories.config}"
  user       = "${var.hashicorp_users.uids[each.value]}:${var.hashicorp_users.primary_gids[each.value]}"
  environment_variables = {
    VAULT_CACERT = "${module.config.directories.tls}/vault-ca.pem"
  }
  ports = [
    "8200:8200",
    "8201:8201"
  ]
  volumes = [
    "${module.config.directories.config}:${module.config.directories.config}",
    "${module.config.directories.data}:${module.config.directories.data}",
    "${module.config.directories.tls}:${module.config.directories.tls}"
  ]
  cap_add = [
    "IPC_LOCK",
    "CAP_SETFCAP",
    "CAP_SETGID",
    "CAP_SETUID"
  ]
  cap_drop = [
    "ALL"
  ]
  external_triggers = merge(module.certificates.triggers, module.vault.triggers)
}
