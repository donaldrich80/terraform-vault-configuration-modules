variable "name" {
  type        = string
  description = "Common name for policy and token"
}

variable "policy" {
  type        = string
  description = "String containing a Vault policy"
}

variable "disallowed_policies" {
  type        = list(string)
  default     = ["default"]
  description = "List of disallowed policies for given role."
}

variable "orphan" {
  type        = bool
  default     = false
  description = "If true, tokens created against this policy will be orphan tokens."
}

variable "token_period" {
  type        = number
  default     = 0
  description = "If set, indicates that the token generated using this role should never expire. The token should be renewed within the duration specified by this value. At each renewal, the token's TTL will be set to the value of this field. Specified in seconds."
}

variable "renewable" {
  type        = bool
  default     = true
  description = "Wether to disable the ability of the token to be renewed past its initial TTL."
}

variable "token_explicit_max_ttl" {
  type        = number
  default     = 0
  description = "If set, will encode an explicit max TTL onto the token in number of seconds. This is a hard cap even if token_ttl and token_max_ttl would otherwise allow a renewal."
}

variable "explicit_max_ttl" {
  default     = ""
  description = "If set, will encode an explicit max TTL onto the token in number of seconds. This is a hard cap even if token_ttl and token_max_ttl would otherwise allow a renewal."
}

variable "path_suffix" {
  type        = string
  default     = ""
  description = "Tokens created against this role will have the given suffix as part of their path in addition to the role name."
}

variable "ttl" {
  type        = string
  default     = ""
  description = "The TTL period of this token"
}

variable "no_parent" {
  type        = bool
  default     = false
  description = "Flag to create a token without parent"
}

variable "no_default_policy" {
  type        = bool
  default     = false
  description = "Flag to not attach the default policy to this token"
}

variable "display_name" {
  type        = string
  default     = "token"
  description = "String containing the token display name"
}

variable "num_uses" {
  type        = number
  default     = 0
  description = "The number of allowed uses of this token"
}

variable "period" {
  default     = ""
  description = "The period of this token"
}

variable "renew_min_lease" {
  type        = number
  default     = 0
  description = "The minimal lease to renew this token"
}

variable "renew_increment" {
  type        = number
  default     = 0
  description = "The renew increment"
}
