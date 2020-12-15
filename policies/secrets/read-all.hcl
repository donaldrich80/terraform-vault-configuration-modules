# List, create, update, and delete key/value secrets
path "secret/*" {
  capabilities = ["read", "list"]
}

path "kv/*" {
  capabilities = ["read", "list"]
}
