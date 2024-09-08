resource "random_password" "onepassword_vault_password" {
  length  = 64
  numeric = true
  lower   = true
  upper   = true
  special = true
}

resource "onepassword_item" "vault" {
  vault = var.onepassword.hashicorp_vault_uuid

  title    = "Hashicorp Vault"
  category = "password"
  url      = "https://vault.${var.domain}"

  password = random_password.onepassword_vault_password.result # dummy

  section {
    label = "Initial Root Token"

    field {
      id    = "root_token"
      label = "token"
      type  = "CONCEALED"
      value = split(": ", one(
        [for log in
          one(jsondecode(replace(one(ansible_playbook.vault_init).ansible_playbook_stdout, var.ansible_bug_string, "")).plays).tasks[0].hosts[one(ansible_playbook.vault_init).name].stdout_lines :
        log if startswith(log, "Initial Root Token")]
        )
      )[1]
    }
  }

  section {
    label = "Unseal Keys"

    dynamic "field" {
      for_each = toset(
        [for log in
          one(jsondecode(replace(one(ansible_playbook.vault_init).ansible_playbook_stdout, var.ansible_bug_string, "")).plays).tasks[0].hosts[one(ansible_playbook.vault_init).name].stdout_lines :
        log if startswith(log, "Unseal Key")]
      )
      content {
        id    = "key_${split(" ", split(": ", field.value)[0])[2]}"
        label = split(": ", field.value)[0]
        type  = "CONCEALED"
        value = split(": ", field.value)[1]
      }
    }
  }

  tags = var.tags

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [section]
  }
}
