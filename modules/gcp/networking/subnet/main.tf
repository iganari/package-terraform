resource "google_compute_subnetwork" "main" {
  # depends_on = [google_compute_network.main]

  name                     = var.subnet.name
  network                  = var.subnet.network
  ip_cidr_range            = var.subnet.ip_cidr_range
  region                   = var.subnet.region
  description              = var.subnet.description
  private_ip_google_access = true

  dynamic "secondary_ip_range" {
    for_each = var.secondary_ip_range

    content {
      range_name    = secondary_ip_range.value.range_name
      ip_cidr_range = secondary_ip_range.value.ip_cidr_range
    }
  }

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.6
    metadata             = "INCLUDE_ALL_METADATA"
  }
}
