output "client_token" {
  value       = vault_token.this.client_token
  description = "Client vault token"
}

output "token_id" {
  value       = vault_token.this.id
  description = "Token ID"
}
