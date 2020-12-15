locals {
  pem_bundle = join("\n", [
    var.ca_key_private,
    var.ca_cert_cert_pem,
  ])
}

variable server_cert_domain {}
variable client_cert_domain {}

variable root_path {
  default     = "cert"
}
variable server_cert_url {}
variable ca_key_private {}
variable ca_cert_cert_pem {}
variable organization {}
variable locality {}
# resource "vault_generic_secret" "ca_key" {
#   path = "data/cert/${var.path}/ca_key"
#   data_json = jsonencode(tls_private_key.ca_key)
# }

# resource "vault_generic_secret" "ca_cert" {
#   path = "data/cert/${var.path}/ca_cert"
#   data_json = jsonencode(tls_self_signed_cert.ca_cert)
# }
