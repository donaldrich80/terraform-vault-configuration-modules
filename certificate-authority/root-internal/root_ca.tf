# Mount Root Certiifacte authority.
resource "vault_mount" "root" {
  type                      = "pki"
  path                      = var.root_path
  default_lease_ttl_seconds = 31556952
  max_lease_ttl_seconds     = 157680000
  description               = "Root Certificate Authority"
}

# Config URLs for the issuer and crl.
resource "vault_pki_secret_backend_config_urls" "config_urls" {
  depends_on              = [vault_mount.root]
  backend                 = vault_mount.root.path
  issuing_certificates    = ["${var.server_cert_url}/v1/${var.root_path}/ca"]
  crl_distribution_points = ["${var.server_cert_url}/v1/${var.root_path}/crl"]
}

# Create Root Certificate in Vault
resource "vault_pki_secret_backend_root_cert" "ca-cert" {
  depends_on           = [vault_pki_secret_backend_config_urls.config_urls]
  backend              = vault_mount.root.path
  type                 = "internal"
  common_name          = "${var.server_cert_domain} Root CA"
  ttl                  = 473040000
  format               = "pem"
  private_key_format   = "der"
  key_type             = "rsa"
  key_bits             = 4096
  exclude_cn_from_sans = true
  ou                   = "Developent"
  organization         = var.organization

}

# Mount Root CA certificate PEM bundle 
resource "vault_pki_secret_backend_config_ca" "ca_config" {
  depends_on = [vault_pki_secret_backend_root_cert.ca-cert]
  backend    = vault_mount.root.path
  pem_bundle = local.pem_bundle
}



