

resource "vault_pki_secret_backend_role" "vault-client-cert" {
  backend            = vault_mount.pki_int.path
  name               = "client-cert-for-${var.client_cert_domain}"
  allowed_domains    = [var.client_cert_domain]
  allow_subdomains   = false
  allow_glob_domains = false
  allow_bare_domains = true
  allow_any_name     = false
  enforce_hostnames  = true
  allow_ip_sans      = true
  #allowed_other_sans = ["1.2.840.113549.1.9.1;utf8:emailAddress"]
  server_flag  = true
  client_flag  = true
  ou           = ["development"]
  organization = [var.organization]
  country      = ["usa"]
  locality     = [var.locality]
  max_ttl      = 63113904
  ttl          = 2592000
  no_store     = true

}
