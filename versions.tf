terraform {
  required_version = "~> 1.8.0"
  required_providers {
    ansible = {
      source  = "ansible/ansible"
      version = ">= 1, < 2"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2, < 3"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3, < 4"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3, < 4"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.12.0, < 1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 4, < 5"
    }
  }
}
