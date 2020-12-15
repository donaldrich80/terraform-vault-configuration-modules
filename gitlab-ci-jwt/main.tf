# docs https://docs.gitlab.com/ce/ci/examples/authenticating-with-hashicorp-vault/

resource "vault_identity_entity" "entity" {
  name = "gitlab-runner"
  # policies = each.value.policies
  # metadata = each.value.metadata
}

resource "vault_jwt_auth_backend" "auth" {
  description  = "gitlab-ci JWT"
  path         = var.auth_path
  jwks_url     = "https://${var.gitlab_url}/-/jwks"
  bound_issuer = var.gitlab_url
}

resource "vault_policy" "gitlab-ci-ro" {
  name   = "gitlab-ci-ro"
  policy = <<EOT
path "kv/gitlab-ci/*" {
  capabilities = ["read"]
}
EOT
}

resource "vault_jwt_auth_backend_role" "role" {
  backend        = vault_jwt_auth_backend.auth.path
  role_name      = var.role_name
  token_policies = var.role_policies
  bound_claims   = var.role_bound_claims
  user_claim             = "user_email"
  role_type              = "jwt"
  token_explicit_max_ttl = 600

}

# resource vault_identity_entity_alias "alias" {
#   name           = "gitlab-runner"
#   mount_accessor = data.vault_auth_backend.backend.accessor
#   canonical_id   = vault_identity_entity.entity.id
# }

data "vault_auth_backend" "backend" {
  path = "gitlab-com"
}
