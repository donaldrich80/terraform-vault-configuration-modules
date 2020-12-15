variable "gitlab_url" {
  description = "gitlab_url"
  default     = "gitlab.com"
}

variable "auth_path" {
  description = "auth_path"
  default     = "gitlab-com"
}

variable "role_name" {
  description = "role_name"
  default     = "gitlab"
}

variable "role_policies" {
  description = "role_policies"
  default     = ["gitlab-ci-ro"]
}

variable "role_bound_claims" {
  description = "role_bound_claims"
  default = {
    namespace_path = "user"
    ref_protected  = "true"
  }
}
