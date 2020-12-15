terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = ">=2.16.0"
    }
  }
}

provider "vault" {}
