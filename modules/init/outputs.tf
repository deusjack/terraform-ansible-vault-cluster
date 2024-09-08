output "root_token" {
  value = onepassword_item.vault.section[0].field[0].value
}
