module "monitoring_dashboards" {
  source     = "../modules/monitoring/dashboards"
  dashboards = "./dashboards-hogehoge.json"
}
