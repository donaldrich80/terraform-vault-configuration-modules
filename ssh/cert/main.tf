resource "vault_mount" "ssh" {
  path        = var.path
  type        = "ssh"
  description = "ssh backend"
  default_lease_ttl_seconds = 300
  max_lease_ttl_seconds = 3000
}

variable "path" {
  default     = "ssh"
}

variable "generate_signing_key" {
  default     = true
}

resource "vault_ssh_secret_backend_ca" "ssh_ca" {
  backend              = var.path
  generate_signing_key = var.generate_signing_key
}


