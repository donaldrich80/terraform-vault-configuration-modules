output "ca_chain" {
  value = vault_pki_secret_backend_root_sign_intermediate.intermediate.ca_chain
}

output "certificate" {
  value = vault_pki_secret_backend_root_sign_intermediate.intermediate.certificate
}

output "private_key" {
  value = vault_pki_secret_backend_intermediate_cert_request.intermediate.private_key
}

resource "vault_generic_secret" "cert_request" {
  path      = "data/cert/${var.int_path}/cert_request"
  data_json = jsonencode(vault_pki_secret_backend_intermediate_cert_request.intermediate)
}
resource "vault_generic_secret" "root_sign" {
  path      = "data/cert/${var.int_path}/root_sign"
  data_json = jsonencode(vault_pki_secret_backend_root_sign_intermediate.intermediate)
}

resource "vault_generic_secret" "set_signed" {
  path      = "data/cert/${var.int_path}/set_signed"
  data_json = jsonencode(vault_pki_secret_backend_intermediate_set_signed.intermediate)
}

