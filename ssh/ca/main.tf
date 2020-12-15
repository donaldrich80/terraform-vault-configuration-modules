# mounting ssh secret engine
# Documentation https://www.terraform.io/docs/providers/vault/r/ssh_secret_backend_role.html

# resource "vault_mount" "ssh" {
#   path        = var.ssh_path
#   type        = "ssh"
#   description = "ssh otp"
# }

# resource "vault_ssh_secret_backend_ca" "ssh_ca" {
#   backend              = var.ssh_path
#   generate_signing_key = true
# }

resource "vault_ssh_secret_backend_role" "ssh_ca_role" {
  name                    = var.name
  backend                 = var.backend
  key_type                = "ca"
  allowed_users           = var.allowed_users
  allow_user_certificates = true
  default_extensions      = var.default_extensions
  allow_user_key_ids      = false
  key_id_format           = "{{token_display_name}}"
  # ttl                     = var.ttl
}

resource "vault_generic_secret" "cert" {
  path = "data/ssh/cert"
  data_json = jsonencode(vault_ssh_secret_backend_role.ssh_ca_role)
}
