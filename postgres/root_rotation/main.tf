resource "vault_mount" "database" {
  path        = var.database_path
  type        = "database"
  description = "postgres managed by Terraform"
}

resource "vault_generic_secret" "example" {
  path = "database/config/postgresql"

  data_json = <<EOT
{
  "plugin_name": "postgresql-database-plugin",
  "allowed_roles": "*",
  "connection_url": "postgresql://{{username}}:{{password}}@${var.POSTGRES_HOST}:${var.POSTGRES_PORT}/postgres?sslmode=disable",
  "username": "${var.POSTGRES_ROOTUSER}",
  "password": "${var.POSTGRES_ROOTPASS}"
}
EOT
}
