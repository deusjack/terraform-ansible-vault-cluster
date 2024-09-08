resource "dns_cname_record" "vault_nodes" {
  for_each = toset(var.vault_nodes)
  name     = "${each.value}.vault"
  cname    = "${each.value}.${var.domain}."
  zone     = "${var.domain}."
  ttl      = 300
}

resource "dns_aaaa_record_set" "vault_cluster" {
  name      = "vault"
  zone      = "${var.domain}."
  addresses = flatten([for aaaa in data.dns_aaaa_record_set.vault_nodes : aaaa.addrs])
  ttl       = 300
}

resource "dns_a_record_set" "vault_cluster" {
  name      = "vault"
  zone      = "${var.domain}."
  addresses = flatten([for a in data.dns_a_record_set.vault_nodes : a.addrs])
  ttl       = 300
}
