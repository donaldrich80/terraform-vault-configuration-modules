terraform {
  required_providers {
    postgresql = {
      source = "cyrilgdn/postgresql"
      version = "1.11.2"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "2.19.0"
    }
  }
}

provider "postgresql" {
  host            = var.POSTGRES_HOST
  port            = var.POSTGRES_PORT
  database        = var.POSTGRES_DB
  username        = var.POSTGRES_ROOTUSER
  password        = var.POSTGRES_ROOTPASS
  sslmode = "disable"
}







