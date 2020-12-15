resource "vault_audit" "file1" {
  type = "file"
  description = var.description
  options = {
    file_path = var.file_path
    mode = "0600"
  }
}

variable description {}
variable file_path {}
