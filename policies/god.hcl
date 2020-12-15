# Create, update, and delete auth methods
path "sys/auth/*"
{
  capabilities = ["create", "update", "delete", "sudo"]
}

# List auth methods
path "sys/auth"
{
  capabilities = ["read"]
}

# Create and manage ACL policies
path "sys/policies/acl/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List ACL policies
path "sys/policies/acl"
{
  capabilities = ["list"]
}

path "/sys/leases/lookup" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Create and manage secrets engines broadly across Vault.
path "sys/mounts/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List enabled secrets engines
path "sys/mount"
{
  capabilities = ["read", "list"]
}

path "sys/health"
{
  capabilities = ["read", "sudo"]
}

path "auth/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List, create, update, and delete key/value secrets at secret/
path "kv/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage transit secrets engine
path "transit/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "ssh/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "database/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# path "database" {
#   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
# }

# Read health checks


path "*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "/" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
