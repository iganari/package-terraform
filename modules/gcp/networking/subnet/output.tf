output "main" {
  value = google_compute_subnetwork.main
}

output "self_link" {
  value = google_compute_subnetwork.main.self_link
}
