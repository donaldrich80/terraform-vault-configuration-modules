variable server_cert_domain {
  description = "We create a role to create client certs, what DNS domain will these certs be in"
  default     = "example.com"
}
variable client_cert_domain {
  description = "Allowed Domains for Client Cert"
  default     = "example.com"
}

variable root_path {
  default     = "cert"
}
variable int_path {
  default     = "int-ca"
}
variable server_cert_url {
  description = "URL to issue root certs"
  default     = "https://example.com"
}


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
