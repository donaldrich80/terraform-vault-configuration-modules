# Manage policies
path "sys/policies/acl/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List policies
path "sys/policies/acl" {
  capabilities = ["list"]
}

# Enable Auth management
path "sys/auth" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Enable and manage secrets engines
path "sys/mounts/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Enable and manage secrets engines
path "sys/mounts" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Create and manage entities and groups
path "identity/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Manage tokens
path "auth/token/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}


# # Allow TF to operate kv store
# path "${var.kv_path}/*" {
#   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
# }

# # Allow TF to operate ssh secret engine
# path "${var.ssh_path}/*" {
#   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
# }
