variable "domain" {
  type        = string
  description = "The domain for your Hashicorp stack"
}

variable "hashicorp_users" {
  type = object({
    triggers       = map(string)
    usernames      = map(string)
    primary_groups = map(string)
  })
  description = "Properties of the user used for defining access to Hashicorp files"
}

variable "vault_nodes" {
  type        = set(string) #
  description = "Set of node names to deploy Hashicorp Vault to"
  validation {
    condition     = length(var.vault_nodes) > 1
    error_message = "You must define at least on node."
  }
}

variable "tls_dir" {
  type        = string
  description = "Path of the TLS dir"
}
