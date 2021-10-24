resource "google_compute_network" "main" {
  name                            = var.vpc.name
  routing_mode                    = "REGIONAL"
  delete_default_routes_on_create = var.vpc.delete_default_routes_on_create
  auto_create_subnetworks         = var.vpc.auto_create_subnetworks
}
