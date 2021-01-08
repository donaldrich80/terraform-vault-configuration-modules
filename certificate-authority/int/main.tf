# Mount point for the Intermediate CA.
resource "vault_mount" "pki_int" {
  type                      = "pki"
  path                      = var.int_path
  default_lease_ttl_seconds = 63072000
  max_lease_ttl_seconds     = 63072000
  description               = "Intermediate Authority for ${var.server_cert_domain}"
}

# Create a CSR (Certificate Signing Request)
resource "vault_pki_secret_backend_intermediate_cert_request" "intermediate" {
  depends_on         = [vault_mount.pki_int]
  backend            = vault_mount.pki_int.path
  type               = "internal"
  common_name        = "${var.server_cert_domain} Intermediate Certificate"
  format             = "pem"
  private_key_format = "der"
  key_type           = "rsa"
  key_bits           = "4096"
}

# Root CA Sign our CSR
resource "vault_pki_secret_backend_root_sign_intermediate" "intermediate" {
  depends_on           = [vault_pki_secret_backend_intermediate_cert_request.intermediate]
  backend              = var.root_path
  csr                  = vault_pki_secret_backend_intermediate_cert_request.intermediate.csr
  common_name          = "${var.server_cert_domain} Intermediate Certificate"
  exclude_cn_from_sans = true
  ou                   = "Developent"
  organization         = "${var.organization}"
  ttl                  = 252288000
}

# Mount signed CSR and The Root CA at Intermediate Authority
resource "vault_pki_secret_backend_intermediate_set_signed" "intermediate" {
  depends_on  = [vault_pki_secret_backend_root_sign_intermediate.intermediate]
  backend     = vault_mount.pki_int.path
  certificate = "${vault_pki_secret_backend_root_sign_intermediate.intermediate.certificate}\n${var.ca_cert_cert_pem}"
}


