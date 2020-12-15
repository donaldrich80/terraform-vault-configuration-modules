variable "username" {
  description = "username"
  default     = "user"
}

variable "userdata" {
  description = "userdata"
}

variable "password" {
  description = "userdata"
  default     = "password"
}

variable "userpass_path" {
  description = "auth path"
  default     = "userpass"
}
# variable "policies" {
#   type    = list(string)
#   default = ["default"]
# }

# variable "default_lease_ttl_seconds" {
#   description = "Default duration of lease validity"
#   default     = "3600s"
# }

# variable "max_lease_ttl_seconds" {
#   description = "Maximum duration of lease validity"
#   default     = "10800s"
# }
