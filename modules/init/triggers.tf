resource "null_resource" "vault" {
  triggers = var.triggers_vault
}


#############
# playbooks #
#############

resource "null_resource" "file_copy" {
  triggers = {
    playbook = filemd5("${path.root}/../ansible/file_copy.yaml")
  }
}

resource "null_resource" "run_command" {
  triggers = {
    playbook = filemd5("${path.root}/../ansible/run_command.yaml")
  }
}

resource "null_resource" "systemd" {
  triggers = {
    playbook = filemd5("${path.root}/../ansible/systemd.yaml")
  }
}
