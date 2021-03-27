resource "vault_auth_backend" "cert" {
  path = "cert"
  type = "cert"
}

resource "vault_cert_auth_backend_role" "role" {
  depends_on     = [tls_self_signed_cert.cert]
  name           = "foo"
  certificate    = tls_self_signed_cert.cert.cert_pem
  backend        = vault_auth_backend.cert.path
  allowed_names  = ["foo.example.org", "baz.example.org"]
  token_ttl      = 300
  token_max_ttl  = 600
  token_policies = ["foo"]
}

resource tls_private_key key {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "vault_generic_secret" "role" {
  depends_on = [vault_cert_auth_backend_role.role]
  path       = "data/cert/${vault_cert_auth_backend_role.role.name}/role"
  data_json  = jsonencode(vault_cert_auth_backend_role.role)
}

# resource "vault_generic_secret" "cert" {
#   depends_on              = [tls_self_signed_cert.cert]
#   path = "data/cert/test/cert"
#   data_json = jsonencode(tls_self_signed_cert.cert)
# }

resource "vault_generic_secret" "cert" {
  depends_on = [tls_self_signed_cert.cert]
  path       = "data/cert/${vault_cert_auth_backend_role.role.name}/cert"
  data_json  = jsonencode(tls_self_signed_cert.cert)
}

resource "vault_generic_secret" "key" {
  depends_on = [tls_private_key.key]
  path       = "data/cert/${vault_cert_auth_backend_role.role.name}/key"
  data_json  = jsonencode(tls_private_key.key)
}

# resource "vault_generic_secret" "key" {
#   depends_on              = [tls_private_key.key]
#   path = "data/cert/test/key"
#   data_json = jsonencode(tls_private_key.key)
# }

resource tls_self_signed_cert cert {
  private_key_pem = tls_private_key.key.private_key_pem
  key_algorithm   = "RSA"
  subject {
    common_name         = "selfsigned"
    organization        = "org"
    organizational_unit = "Development"
    street_address      = ["1234 Main Street"]
    locality            = "here"
    province            = "CA"
    country             = "USA"
    postal_code         = "90210"

  }
  validity_period_hours = 175200
  allowed_uses = [
    "cert_signing",
    "crl_signing"
  ]
  #is_ca_certificate = true

}