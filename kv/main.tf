resource "vault_mount" "kv" {
  path        = var.path
  type        = "kv"
  description = "kv backend"
}

resource "vault_generic_secret" "secrets" {
  depends_on = [vault_mount.kv]
  for_each  = fileset("secrets/", "**")
  path      = "${var.path}/${dirname(each.key)}"
  data_json = file("secrets/${each.key}")
}
