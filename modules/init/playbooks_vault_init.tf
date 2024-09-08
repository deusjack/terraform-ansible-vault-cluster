########
# init #
########

# Init first node
resource "ansible_playbook" "vault_init" {
  count                   = length(var.vault_nodes) > 0 ? 1 : 0
  name                    = tolist(var.vault_nodes)[0]
  playbook                = "${path.root}/../ansible/run_command.yaml"
  replayable              = false
  ignore_playbook_failure = false
  extra_vars = {
    cmd = "podman exec vault vault operator init"
  }
}

# Join other nodes to first node's raft cluster
resource "ansible_playbook" "vault_join" {
  for_each                = length(var.vault_nodes) > 1 ? toset(slice(tolist(var.vault_nodes), 1, length(var.vault_nodes))) : toset([])
  name                    = each.value
  playbook                = "${path.root}/../ansible/run_command.yaml"
  replayable              = false
  ignore_playbook_failure = false
  extra_vars = {
    cmd = join(" ", [
      "podman exec vault vault operator raft join",
      "-leader-ca-cert=@${var.files.ca[each.value]}",
      "-leader-client-cert=@${var.files.certs[each.value]}",
      "-leader-client-key=@${var.files.keys[each.value]}",
      "\"https://${tolist(var.vault_nodes)[0]}.vault.${var.domain}:8200\""
    ])
  }
  lifecycle {
    replace_triggered_by = [null_resource.run_command]
  }
}

resource "null_resource" "vault_unseal" {
  for_each = var.nodes.amd64
  triggers = {
    script   = filemd5("${path.root}/../config/vault.d/unseal.sh.tftpl")
    tmp_file = one(local_file.vault_unseal_script).content
  }
}

##########
# unseal #
##########

resource "local_file" "vault_unseal_script" {
  count    = length(var.nodes.amd64) > 0 ? 1 : 0
  filename = "${path.root}/../ansible/files/tmp/vault_unseal.sh"
  content = templatefile("${path.root}/../config/vault.d/unseal.sh.tftpl", {
    ONEPASSWORD_ENVIRONMENT = var.onepassword.environment_path
    VAULT_NODES             = join(" ", [for node in var.vault_nodes : "\"https://${node}.vault.${var.domain}:8200\""])
    VAULT_TLS_DIR           = var.directories.tls
  })
  directory_permission = "0755"
  file_permission      = "0644"
}

resource "ansible_playbook" "unseal_script_file" {
  depends_on              = [local_file.vault_unseal_script]
  for_each                = var.nodes.amd64
  name                    = each.value
  playbook                = "${path.root}/../ansible/file_copy.yaml"
  replayable              = false
  ignore_playbook_failure = false
  extra_vars = {
    dest_path = "/usr/local/sbin/vault_unseal.sh"
    src_path  = "tmp/vault_unseal.sh"
    file_mode = "0700"
    file_owner : "root"
  }
  lifecycle {
    replace_triggered_by = [null_resource.file_copy, null_resource.vault_unseal]
  }
}

resource "ansible_playbook" "vault_unseal_systemd_file" {
  for_each                = var.nodes.amd64
  name                    = each.value
  playbook                = "${path.root}/../ansible/file_copy.yaml"
  replayable              = false
  ignore_playbook_failure = false
  extra_vars = {
    dest_path = "/etc/systemd/system/vault-unseal.service"
    src_path  = "${path.root}/../config/systemd/vault-unseal.service"
    file_mode = "0644"
    file_owner : "root"
  }
  lifecycle {
    replace_triggered_by = [null_resource.file_copy, null_resource.vault_systemd_file]
  }
}

resource "ansible_playbook" "vault_unseal_timer_file" {
  for_each                = var.nodes.amd64
  name                    = each.value
  playbook                = "${path.root}/../ansible/file_copy.yaml"
  replayable              = false
  ignore_playbook_failure = false
  extra_vars = {
    dest_path = "/etc/systemd/system/vault-unseal.timer"
    src_path  = "${path.root}/../config/systemd/vault-unseal.timer"
    file_mode = "0644"
    file_owner : "root"
  }
  lifecycle {
    replace_triggered_by = [null_resource.file_copy, null_resource.vault_systemd_file]
  }
}

resource "null_resource" "vault_systemd_file" {
  triggers = {
    unseal = filemd5("${path.root}/../config/systemd/vault-unseal.service")
    timer  = filemd5("${path.root}/../config/systemd/vault-unseal.timer")
  }
}

resource "ansible_playbook" "vault_systemd_daemon_reload" {
  depends_on = [
    ansible_playbook.vault_unseal_systemd_file,
    ansible_playbook.vault_unseal_timer_file
  ]
  for_each                = var.vault_nodes
  name                    = each.value
  playbook                = "${path.root}/../ansible/run_command.yaml"
  replayable              = false
  ignore_playbook_failure = false
  extra_vars = {
    cmd = "systemctl daemon-reload"
  }
  lifecycle {
    replace_triggered_by = [
      null_resource.run_command,
      null_resource.vault_systemd_file
    ]
  }
}

resource "ansible_playbook" "vault_systemd_timer" {
  depends_on              = [ansible_playbook.vault_systemd_daemon_reload]
  for_each                = var.nodes.amd64
  name                    = each.value
  playbook                = "${path.root}/../ansible/systemd.yaml"
  replayable              = false
  ignore_playbook_failure = false
  extra_vars = {
    systemd_service_name = "vault-unseal.timer"
  }
  lifecycle {
    replace_triggered_by = [null_resource.systemd, ansible_playbook.vault_systemd_daemon_reload]
  }
}

resource "ansible_playbook" "vault_unseal" {
  depends_on = [
    ansible_playbook.vault_init,
    ansible_playbook.vault_join,
    ansible_playbook.unseal_script_file
  ]
  count                   = length(var.nodes.amd64) > 0 ? 1 : 0
  name                    = tolist(var.nodes.amd64)[0]
  playbook                = "${path.root}/../ansible/run_command.yaml"
  replayable              = false
  ignore_playbook_failure = false
  extra_vars = {
    cmd = "vault_unseal.sh"
  }
  lifecycle {
    replace_triggered_by = [null_resource.vault]
  }
}

resource "time_sleep" "vault_unseal" {
  depends_on      = [ansible_playbook.vault_unseal]
  for_each        = var.nodes.amd64
  create_duration = "30s"
  triggers        = ansible_playbook.vault_systemd_timer[each.value].extra_vars
  lifecycle {
    replace_triggered_by = [null_resource.vault]
  }
}
