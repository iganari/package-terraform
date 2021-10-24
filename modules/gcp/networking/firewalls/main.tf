resource "google_compute_firewall" "main" {
  name          = var.firewall.name
  network       = var.firewall.network
  source_ranges = var.firewall.source_ranges

  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = var.allow_tcp
  }
  allow {
    protocol = "udp"
    ports    = var.allow_udp
  }
}
