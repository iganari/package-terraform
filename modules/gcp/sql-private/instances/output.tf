output "main" {
  value = google_compute_network.main
}

output "self_link" {
  value = google_compute_network.main.self_link
}
