resource "vault_auth_backend" "userpass" {
  type        = "userpass"
  description = "userpass"
  path        = var.userpass_path
}

resource "vault_identity_entity" "entity" {
  name = var.username
  # policies = each.value.policies
  # metadata = each.value.metadata
}

resource "vault_generic_endpoint" "user" {
  depends_on           = [vault_identity_entity.entity]
  path                 = "auth/userpass/users/${var.username}"
  ignore_absent_fields = true
  data_json            = file(var.userdata)
}

resource "vault_generic_endpoint" "token" {
  depends_on     = [vault_generic_endpoint.user]
  path           = "auth/userpass/login/${var.username}"
  disable_read   = true
  disable_delete = true
  data_json      = <<EOT
{
  "password": "${var.password}"
}
EOT
}

resource "vault_identity_entity_alias" "alias" {
  depends_on     = [vault_generic_endpoint.token]
  name           = var.username
  mount_accessor = vault_auth_backend.userpass.accessor
  canonical_id   = vault_identity_entity.entity.id
}

