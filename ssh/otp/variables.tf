variable "path" {
  default = "ssh"
}

variable "ssh_otp_role" {
  description = "ssh secret engine OTP role"
  default     = "otp"
}

variable "allowed_users" {
  description = "Specifies a comma-separated list of usernames that are to be allowed for OTP based Auth, only if certain usernames are to be allowed."
  default     = "*"
}

variable "default_user" {
  description = "Specifies the default username for which a credential will be generated"
  default     = "guest"
}

variable "cidr_list" {
  description = "The comma-separated string of CIDR blocks for which this role is applicable"
  default     = "0.0.0.0/0"
}
# variable "default_lease_ttl_seconds" {}

