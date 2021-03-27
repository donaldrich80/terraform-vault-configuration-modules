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
  host     = var.POSTGRES_HOST
  port     = var.POSTGRES_PORT
  database = var.POSTGRES_DB
  username = var.POSTGRES_ROOTUSER
  password = var.POSTGRES_ROOTPASS
  sslmode  = "disable"
}
resource "postgresql_role" "role" {
  name            = "username"
  login           = true
  password        = "userpass"
  create_database = true
  create_role     = true
  superuser       = true
  replication     = true
}


resource "vault_generic_secret" "example" {
  path = "database/config/${var.POSTGRES_ROOTUSER}"

  data_json = <<EOT
{
  "plugin_name": "postgresql-database-plugin",
  "allowed_roles": "*",
  "connection_url": "postgresql://{{username}}:{{password}}@192.168.1.101:5432/postgres?sslmode=disable",
  "username": "${var.POSTGRES_ROOTUSER}",
  "password": "${var.POSTGRES_ROOTPASS}"
}
EOT
}
resource "vault_database_secret_backend_static_role" "static_role" {
  backend             = "database"
  name                = "username_static_role"
  db_name             = "username_db"
  username            = "username"
  rotation_period     = "3600"
  rotation_statements = ["ALTER USER \"{{name}}\" WITH PASSWORD '{{password}}';"]
}

resource "vault_policy" "postgres" {
  name   = "username_static_role"
  policy = <<EOT
path "database/static-creds/username_static_role" {
  capabilities = [ "read" ]
}
EOT
}

variable "POSTGRES_ROOTUSER" {
}

variable "POSTGRES_ROOTPASS" {
}
variable "POSTGRES_DB" {
}
variable "POSTGRES_HOST" {
}
variable "POSTGRES_PORT" {
  default = 5432
}
