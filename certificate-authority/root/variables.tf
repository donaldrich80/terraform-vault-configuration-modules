variable server_cert_domain {
  description = "We create a role to create client certs, what DNS domain will these certs be in"
  default     = "mydomain.com"
}
variable client_cert_domain {
  description = "Allowed Domains for Client Cert"
  default     = "mydomain.com"
}

variable path {
  default     = "cert"
}
variable server_cert_url {
  # description = "We create a role to create client certs, what DNS domain will these certs be in"
  # default     = "mydomain.com"
}
variable ca_cert_cert_pem {}
