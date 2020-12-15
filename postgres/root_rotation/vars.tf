
variable "POSTGRES_ROOTUSER" {
}

variable "POSTGRES_ROOTPASS" {
}
variable "POSTGRES_DB" {
}
variable "POSTGRES_HOST" {
}
variable "POSTGRES_PORT" {
  default = 5432
}
variable "database_path" {
  description = "database secret engine mount point"
  default     = "database"
}
