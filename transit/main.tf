resource "vault_mount" "transit" {
  path                      = var.path
  type                      = "transit"
  description               = "transit auth backend"
  default_lease_ttl_seconds = 3600
  max_lease_ttl_seconds     = 86400
}

resource "vault_transit_secret_backend_key" "key" {
  backend = vault_mount.transit.path
  name    = var.key_name
}

resource "vault_policy" "policy" {
  name   = var.key_name
  policy = <<EOT
path "${var.path}/encrypt/${var.key_name}" {
  capabilities = [ "update" ]
}
path "${var.path}/decrypt/${var.key_name}" {
  capabilities = [ "update" ]
}
EOT
}

resource "vault_token" "token" {
  policies     = [vault_policy.policy.name]
  wrapping_ttl = 120
}

# resource "vault_generic_endpoint" "unwrap" {
#   depends_on     = [vault_token.token]
#   path           = "sys/wrapping/wrap"
#   disable_read   = true
#   disable_delete = true
#   write_fields         = ["*"]
#   ignore_absent_fields = true
#   data_json = <<EOT
# {
#   "token": "${vault_token.token.client_token}"
# }
# EOT
# }


# VAULT_TOKEN=<wrapping_token> vault unwrap

# /sys/wrapping/unwrap

# {
#   "token": "abcd1234..."
# }

# resource "vault_generic_endpoint" "unwrap" {
#   depends_on     = [vault_token.token]
#   path           = "/sys/wrapping/unwrap"
#   disable_read   = true
#   disable_delete = true
#   write_fields         = ["*"]
#   ignore_absent_fields = true
#   data_json = <<EOT
# {
#   "token": "${vault_token.token.wrapped_token}"
# }
# EOT
# }

# output "out2" {
#   value = vault_generic_endpoint.unwrap.write_data["*"]
# }
