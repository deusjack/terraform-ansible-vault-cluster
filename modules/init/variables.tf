variable "ansible_bug_string" {
  type        = string
  description = "The error string, that is wrongly put into ansible stdout"
}

variable "domain" {
  type        = string
  description = "The domain for your Hashicorp stack"
}

variable "nodes" {
  type        = map(set(string))
  description = "Map of groups with node names"
  validation {
    condition     = lookup(var.nodes, "amd64", null) != null
    error_message = "You must define at least one amd64 node."
  }
  validation {
    condition     = length(var.nodes.all) >= 3
    error_message = "Cluster must have at least 3 nodes."
  }
}

variable "onepassword" {
  type = object({
    hashicorp_vault_uuid = string
    environment_path     = string
  })
  description = "Settings for 1password"
}

variable "tags" {
  type        = list(string)
  description = "Default tags for all taggable resources"
}

variable "vault_nodes" {
  type        = set(string) #
  description = "Set of node names to deploy Hashicorp Vault to"
  validation {
    condition     = length(var.vault_nodes) > 1
    error_message = "You must define at least on node."
  }
}

variable "directories" {
  type = object({
    data   = string
    config = string
    tls    = string
  })
  description = "Path for data, config and tls directories"
}

variable "files" {
  type = object({
    ca    = map(string)
    keys  = map(string)
    certs = map(string)
  })
}

variable "triggers_vault" {
  type        = map(string)
  description = "Triggers for vault changes"
}
