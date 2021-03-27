module "root_cert_auth" {
  source             = "./root-internal"
  depends_on         = [tls_private_key.ca_key, tls_self_signed_cert.ca_cert]
  server_cert_url    = var.server_cert_url
  client_cert_domain = var.client_cert_domain
  server_cert_domain = var.server_cert_domain
  ca_key_private     = tls_private_key.ca_key.private_key_pem
  ca_cert_cert_pem   = tls_self_signed_cert.ca_cert.cert_pem
  organization       = var.organization
  locality           = var.locality
}

# module "int_cert_auth" {
#   source       = "./int"
#   depends_on              = [module.root_cert_auth, tls_private_key.ca_key, tls_self_signed_cert.ca_cert]
#   server_cert_domain = var.server_cert_domain
#   client_cert_domain = var.client_cert_domain
#   ca_cert_cert_pem = tls_self_signed_cert.ca_cert.cert_pem
#   organization = var.organization
#   locality = var.locality
#   root_path = var.root_path
#   int_path = var.int_path
# }

resource tls_private_key ca_key {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Generate a Self Signed Root Certificate Authority
resource tls_self_signed_cert ca_cert {
  private_key_pem = tls_private_key.ca_key.private_key_pem
  key_algorithm   = "RSA"
  subject {
    common_name         = "${var.server_cert_domain} Root CA"
    organization        = var.organization
    organizational_unit = "Development"
    street_address      = ["1234 Main Street"]
    locality            = var.locality
    province            = "CA"
    country             = "USA"
    postal_code         = "90210"

  }
  validity_period_hours = 175200
  allowed_uses = [
    "cert_signing",
    "crl_signing"
  ]
  is_ca_certificate = true

}
