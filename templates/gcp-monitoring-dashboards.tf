module "google_monitoring_dashboard" {
  source     = "../modules/monitoring/dashboards"
  dashboards = "./dashboards-hogehoge.json"
}
