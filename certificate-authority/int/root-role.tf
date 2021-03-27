# Role for server certs
resource "vault_pki_secret_backend_role" "role-server-cer" {
  backend            = var.root_path
  name               = "server-cert-for-${var.server_cert_domain}"
  allowed_domains    = [var.server_cert_domain]
  allow_subdomains   = true
  allow_glob_domains = false
  allow_any_name     = false
  enforce_hostnames  = true
  allow_ip_sans      = true
  server_flag        = true
  client_flag        = false
  ou                 = ["development"]
  organization       = [var.organization]
  country            = ["usa"]
  locality           = [var.locality]
  max_ttl            = 63113904
  ttl                = 2592000
  no_store           = true

}
