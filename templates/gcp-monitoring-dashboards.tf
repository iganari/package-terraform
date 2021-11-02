module "monitoring-dashboards" {
  source     = "../modules/monitoring/dashboards"
  dashboards = "./dashboards-hogehoge.json"
}
