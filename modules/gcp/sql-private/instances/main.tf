resource "google_sql_database_instance" "main" {
  name              = var.sql.name
  database_version  = var.sql.version
  region            = var.sql.region

  settings {
    tier = var.sql.tier
  }

}
