resource "vault_generic_secret" "mount" {
  path      = "data/transit/${var.key_name}/mount"
  data_json = jsonencode(vault_mount.transit)
}

resource "vault_generic_secret" "key" {
  path      = "data/transit/${var.key_name}/key"
  data_json = jsonencode(vault_transit_secret_backend_key.key)
}

resource "vault_generic_secret" "token" {
  path      = "data/transit/${var.key_name}/key"
  data_json = jsonencode(vault_token.token)
}
