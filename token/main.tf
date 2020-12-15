resource "vault_policy" "policy" {
  name   = var.name
  policy = var.policy
}

resource "vault_token_auth_backend_role" "role" {
  role_name              = var.name
  allowed_policies       = [vault_policy.this.id]
  disallowed_policies    = var.disallowed_policies
  orphan                 = var.orphan
  token_period           = var.token_period
  renewable              = var.renewable
  token_explicit_max_ttl = var.token_explicit_max_ttl
  path_suffix            = var.path_suffix
}

resource "vault_token" "token" {
  role_name = vault_token_auth_backend_role.this.role_name

  policies = [vault_policy.this.id]

  renewable         = var.renewable
  ttl               = var.ttl
  no_parent         = var.no_parent
  no_default_policy = var.no_default_policy
  explicit_max_ttl  = var.explicit_max_ttl
  display_name      = var.display_name
  num_uses          = var.num_uses
  period            = var.period
  renew_min_lease   = var.renew_min_lease
  renew_increment   = var.renew_increment
}
