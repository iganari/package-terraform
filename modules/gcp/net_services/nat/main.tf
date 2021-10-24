resource "google_compute_router" "main" {
  name    = var.router.name
  network = var.router.network
  region  = var.router.region
}

resource "google_compute_address" "main" {
  depends_on = [google_compute_router.main]

  name   = var.address.name
  region = google_compute_router.main.region
}

resource "google_compute_router_nat" "main" {
  depends_on = [google_compute_address.main]

  name   = var.nat.name
  region = google_compute_router.main.region
  router = google_compute_router.main.name

  nat_ip_allocate_option = "MANUAL_ONLY"
  nat_ips                = google_compute_address.main.*.self_link

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = var.nat.subnet
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}
