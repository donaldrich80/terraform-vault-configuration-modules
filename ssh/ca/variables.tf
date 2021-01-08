variable "backend" {
  default = "ssh"
}

variable "name" {
  default = "ca"
}

variable "allowed_users" {
  description = "Specifies a comma-separated list of usernames that are to be allowed for CA based Auth, only if certain usernames are to be allowed."
  default     = "*"
}

variable "default_extensions" {
  type        = map(string)
  description = "Specifies a map of extensions that certificates have when signed"
  default = {
    permit-pty : ""
    permit-port-forwarding : ""
  }
}

# variable "ttl" {
#   description = "Specifies the maximum Time To Live value."
#   default     = "300"
# }
