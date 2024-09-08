data "dns_aaaa_record_set" "vault_nodes" {
  for_each = toset(var.vault_nodes)
  host     = "${each.value}.${var.domain}"
}

data "dns_a_record_set" "vault_nodes" {
  for_each = toset(var.vault_nodes)
  host     = "${each.value}.${var.domain}"
}
