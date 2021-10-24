output "router_main" {
  value = google_compute_router.main
}
output "router_self_link" {
  value = google_compute_router.main.self_link
}

output "address_main" {
  value = google_compute_address.main
}
output "address_self_link" {
  value = google_compute_address.main.self_link
}

output "nat_main" {
  value = google_compute_router_nat.main
}
