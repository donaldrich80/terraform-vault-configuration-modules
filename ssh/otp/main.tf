# mounting ssh secret engine
# Documentation https://www.terraform.io/docs/providers/vault/r/ssh_secret_backend_role.html

# resource "vault_mount" "ssh" {
#   path        = var.ssh_path
#   type        = "ssh"
#   description = "ssh otp"
#   default_lease_ttl_seconds = var.default_lease_ttl_seconds
# }

resource "vault_ssh_secret_backend_role" "ssh_otp_role" {
  name          = var.ssh_otp_role
  backend       = var.path
  key_type      = "otp"
  allowed_users = var.allowed_users
  cidr_list     = var.cidr_list
  # ttl           = var.ttl
  default_user = var.default_user
}

resource "vault_generic_secret" "otp" {
  path      = "data/ssh/otp"
  data_json = jsonencode(vault_ssh_secret_backend_role.ssh_otp_role)
}
