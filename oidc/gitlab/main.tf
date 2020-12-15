resource "vault_jwt_auth_backend" "oidc" {
  description        = "Gitlab OIDC Login"
  path               = "oidc"
  type               = "oidc"
  oidc_discovery_url = "https://gitlab.com"
  oidc_client_id     = var.oidc_client_id
  oidc_client_secret = var.oidc_client_secret
  default_role       = "default"
}

resource "vault_jwt_auth_backend_role" "oidc" {
  backend               = vault_jwt_auth_backend.oidc.path
  role_name             = "gitlab-oidc"
  token_policies        = ["god"]
  bound_audiences       = [var.oidc_client_id]
  user_claim            = "sub"
  role_type             = "oidc"
  oidc_scopes           = ["openid"]
  allowed_redirect_uris = var.allowed_redirect_uris
}

