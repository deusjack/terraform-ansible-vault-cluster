terraform {
  required_version = "~> 1.8.0"
  required_providers {
    ansible = {
      source  = "ansible/ansible"
      version = ">= 1.0, < 2"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3.0, < 4"
    }
  }
}
