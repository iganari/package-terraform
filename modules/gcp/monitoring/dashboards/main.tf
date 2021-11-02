resource "google_monitoring_dashboard" "main" {
  # Dashboard json is downloaded from API for given dashboard.
  dashboard_json = file("${var.dashboards}")
}
