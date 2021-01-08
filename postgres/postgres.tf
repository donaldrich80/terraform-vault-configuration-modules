module "postgres_root_rotation" {
  source            = "./root_rotation"
  POSTGRES_ROOTUSER = "postgres"
  POSTGRES_ROOTPASS = "password"
  POSTGRES_DB       = "postgres"
  POSTGRES_HOST     = "192.168.1.101"
  database_path     = "database"
}

