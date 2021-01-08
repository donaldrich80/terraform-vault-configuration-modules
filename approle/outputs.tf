output "role_id" {
  description = "The role ID of created approle"
  value       = vault_approle_auth_backend_role.role.role_id
}

output "secret_id" {
  description = "The secret ID of created approle"
  value       = vault_approle_auth_backend_role_secret_id.id.secret_id
}

resource "vault_generic_secret" "approle" {
  path      = "data/approle/${var.role_name}"
  data_json = <<EOT
{
  "role_id": "${vault_approle_auth_backend_role.role.role_id}",
  "secret_id": "${vault_approle_auth_backend_role_secret_id.id.secret_id}"
}
EOT
}

resource "vault_generic_secret" "backend" {
  path      = "data/approle/${var.role_name}/backend"
  data_json = jsonencode(vault_auth_backend.approle)
}


resource "vault_generic_secret" "role" {
  path      = "data/approle/${var.role_name}/role"
  data_json = jsonencode(vault_approle_auth_backend_role.role)
}

resource "vault_generic_secret" "secret_id" {
  path      = "data/approle/${var.role_name}/secret_id"
  data_json = jsonencode(vault_approle_auth_backend_role_secret_id.id)
}

resource "vault_generic_secret" "login" {
  path      = "data/approle/${var.role_name}/login"
  data_json = jsonencode(vault_approle_auth_backend_login.login)
}

resource "vault_generic_secret" "alias" {
  path      = "data/approle/${var.role_name}/alias"
  data_json = jsonencode(vault_identity_entity_alias.alias)
}

resource "vault_generic_secret" "entity" {
  path      = "data/approle/${var.role_name}/entity"
  data_json = jsonencode(vault_identity_entity.entity)
}
